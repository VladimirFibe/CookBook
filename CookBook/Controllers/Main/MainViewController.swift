import UIKit

enum MainItem: Hashable {
    case trending(RecipeStruct)
    case popular(RecipeStruct)
    case recent(RecipeStruct)
    case chef(RecipeStruct)
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
    let trendings: [RecipeStruct]
    let populars: [RecipeStruct]
    let recents: [RecipeStruct]
    let chefs: [RecipeStruct]
}

private typealias DataSource = UICollectionViewDiffableDataSource<MainRow, MainItem>
private typealias Snapshot = NSDiffableDataSourceSnapshot<MainRow, MainItem>

class MainViewController: UIViewController {

    private let store = MainStore()
    private var bag = Bag()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.register(RecipeMainCell.self, forCellWithReuseIdentifier: RecipeMainCell.id)
        collectionView.register(PopularRecipeMainCell.self, forCellWithReuseIdentifier: PopularRecipeMainCell.id)
        collectionView.register(RecentRecipeCell.self, forCellWithReuseIdentifier: RecentRecipeCell.id)
        collectionView.register(ChefCell.self, forCellWithReuseIdentifier: ChefCell.id)
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.id)
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
        setupObservers()
        store.sendAction(.fetch)
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
            case let .chef(recipe): return self.configure(ChefCell.self, with: recipe, for: indexPath)
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
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with recipe: RecipeStruct, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.id, for: indexPath) as? T
        else { fatalError("Unable to dequeue \(cellType)")}
        cell.configure(with: recipe)
        return cell
    }
    
    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                guard let self = self else { return }
                switch event {
                case let .didLoadSections(main):
                    self.viewModel.mainContent = main
                    self.reloadData()
                }
            }.store(in: &bag)
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
                    title: "Команда намбер 7",
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
            items: [
                RecipeStruct(id: 0, title: "@alx_kkn", image: "https://avatarko.ru/img/kartinka/32/film_pirat_31050.jpg", imageType: "jpg"),
                RecipeStruct(id: 1, title: "@SHegor74", image: "https://photoshablon.com/_ph/46/2/865486425.jpg?1678459719", imageType: "jpg"),
                RecipeStruct(id: 2, title: "@giicom", image: "https://photoshablon.com/_ph/46/2/218949528.jpg?1678459904", imageType: "jpg"),
                RecipeStruct(id: 3, title: "@kikreen", image: "https://photoshablon.com/_ph/46/2/220457423.jpg?1678459940", imageType: "jpg"),
                RecipeStruct(id: 4, title: "@ag70707", image: "https://photoshablon.com/_ph/46/2/139276644.jpg?1678460346", imageType: "jpg"),
                RecipeStruct(id: 5, title: "@klevzhits_igor", image: "https://photoshablon.com/_ph/46/2/371771960.jpg?1678460465", imageType: "jpg"),
                RecipeStruct(id: 6, title: "@vasilii_v123", image: "https://photoshablon.com/_ph/46/2/772695716.jpg?1678460497", imageType: "jpg"),
                RecipeStruct(id: 7, title: "@macservicekz", image: "https://photoshablon.com/_ph/46/2/2195982.jpg?1678460578", imageType: "jpg")].map { .chef($0)})
    ]
}

protocol SelfConfiguringCell {
    static var id: String { get }
    func configure(with recipe: RecipeStruct)
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = MainSection(rawValue: indexPath.section)
        if section != .chef, let item = dataSource.itemIdentifier(for: indexPath) {
            let controller = RecipeDetailViewController()
            switch item {
            case .popular(let recipe): controller.configure(with: recipe)
            case .recent(let recipe): controller.configure(with: recipe)
            case .trending(let recipe): controller.configure(with: recipe)
            case .chef(_): return
            }
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        configureContextMenu(index: indexPath.row)
    }
 
    func configureContextMenu(index: Int) -> UIContextMenuConfiguration{
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
            let share = UIAction(title: "Поделиться", image: UIImage(systemName: "square.and.arrow.up"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                print("edit button clicked")
                //add tasks...
            }
            let favorite = UIAction(title: "Добавить в избранное", image: UIImage(systemName: "heart"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                print("edit button clicked")
                //add tasks...
            }
            let delete = UIAction(title: "Удалить", image: UIImage(systemName: "trash"), identifier: nil, discoverabilityTitle: nil,attributes: .destructive, state: .off) { (_) in
                print("delete button clicked")
                //add tasks...
            }
            return UIMenu(title: "Options", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [share, favorite,delete])
        }
        return context
    }
}
