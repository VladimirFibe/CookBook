import UIKit

enum MainItem: Hashable {
    case trending(Recipe)
    case popular(Recipe)
    case recent(Recipe)
    case chef(String)
}

struct MainRow: Hashable {
    var index: Int
    var title: String
    var items: [MainItem]
}

enum MainSection: Int, CaseIterable {
    case trending
    case popular
    case recent
    case chef
}

struct MainContent {
    let trendings: [Recipe]
    let populars: [Recipe]
    let recents: [Recipe]
    let chefs: [String]
}

private typealias DataSource = UICollectionViewDiffableDataSource<MainRow, MainItem>
private typealias Snapshot = NSDiffableDataSourceSnapshot<MainRow, MainItem>
class MainViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .rowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RecipeMainCell.self, forCellWithReuseIdentifier: RecipeMainCell.id)
        collectionView.register(PopularRecipeMainCell.self, forCellWithReuseIdentifier: PopularRecipeMainCell.id)
        collectionView.register(RecentRecipeCell.self, forCellWithReuseIdentifier: RecentRecipeCell.id)
        collectionView.register(ChefCell.self, forCellWithReuseIdentifier: ChefCell.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)
        return collectionView
    }()
    
    private var dataSource: DataSource!
    private var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        title = "Get amazing recipes"
        let searchController = UISearchController()
        searchController.isActive = true
        searchController.searchBar.placeholder = "Search recipes"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let margin = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: margin.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
        ])
        
        configureDataSouce()
        reloadData()
    }
    
    private func configureDataSouce() {
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let item = self.viewModel.rows[indexPath.section].items[indexPath.row]
            switch item {
            case let .trending(recipe): return self.configure(RecipeMainCell.self, with: recipe, for: indexPath)
            case let .popular(recipe): return self.configure(PopularRecipeMainCell.self, with: recipe, for: indexPath)
            case let .recent(recipe): return self.configure(RecentRecipeCell.self, with: recipe, for: indexPath)
            case let .chef(name): return self.configureChefs(with: name, for: indexPath)
            }
        }
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath) as! SectionHeaderView
            headerView.title.text = self?.viewModel.rows[indexPath.section].title
            return headerView
        }
    }
    
    private func reloadData() {
        var snapshot = Snapshot()
        let rows = viewModel.rows
        snapshot.appendSections(rows)
        rows.forEach {
            snapshot.appendItems($0.items, toSection: $0)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with recipe: Recipe, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.id, for: indexPath) as? T
        else { fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: recipe)
        return cell
    }
    
    func configureChefs(with name: String, for indexPath: IndexPath) -> ChefCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCell.id, for: indexPath) as? ChefCell
        else { fatalError("Unable to dequeue ChefCell")}
        cell.configure(with: name)
        return cell
    }
}

final class MainViewModel {
    var mainContent: MainContent? {
        didSet {
            rows = [
                MainRow(
                    index: MainSection.trending.rawValue,
                    title: "Trending now 🔥",
                    items: (mainContent?.trendings ?? []).map { .trending($0)}),
                MainRow(
                    index: MainSection.popular.rawValue,
                    title: "Popular category ",
                    items: (mainContent?.populars ?? []).map { .popular($0)}),
                MainRow(
                    index: MainSection.recent.rawValue,
                    title: "Recent recipe",
                    items: (mainContent?.recents ?? []).map { .recent($0)}),
                MainRow(
                    index: MainSection.chef.rawValue,
                    title: "Popular creators",
                    items: (mainContent?.chefs ?? []).map { .chef($0)})
            ]
        }
    }
    var rows: [MainRow] = [
        MainRow(
            index: MainSection.trending.rawValue,
            title: "Trending now 🔥",
            items: RecipeHTTPClient.shared.getRecipes().map { .trending($0)}),
        MainRow(
            index: MainSection.popular.rawValue,
            title: "Popular category ",
            items: RecipeHTTPClient.shared.getRecipes().reversed().map { .popular($0)}),
        MainRow(
            index: MainSection.recent.rawValue,
            title: "Recent recipe",
            items: RecipeHTTPClient.shared.getRecipes().map { .recent($0)}),
        MainRow(
            index: MainSection.chef.rawValue,
            title: "Команда намбер 7",
            items: ["@alx_kkn", "@SHegor74", "@giicom", "@kikreen", "@ag70707", "@klevzhits_igor", "@vasilii_v123", "@macservicekz"].map { .chef($0)})
    ]
}

protocol SelfConfiguringCell {
    static var id: String { get }
    func configure(with recipe: Recipe)
}
