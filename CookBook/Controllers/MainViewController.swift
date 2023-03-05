import UIKit

enum MainItem: Hashable {
    case trending(RecipeStruct)
    case popular(RecipeStruct)
    case recent(RecipeStruct)
    case chef(String)
}

struct MainRow: Hashable {
    var index: Int
    var title: String
    var items: [MainItem]
}

enum MainSection: Int, CaseIterable {
    case trending = 0
    case popular
    case recent
    case chef
}

struct MainContent {
    let trendings: [RecipeStruct]
    let populars: [RecipeStruct]
    let recents: [RecipeStruct]
    let chefs: [String]
}

private typealias DataSource = UICollectionViewDiffableDataSource<MainRow, MainItem>
private typealias Snapshot = NSDiffableDataSourceSnapshot<MainRow, MainItem>
class MainViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .rowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RecipeUIView.self, forCellWithReuseIdentifier: RecipeUIView.id)
        collectionView.register(HalfRoundImageUIView.self, forCellWithReuseIdentifier: HalfRoundImageUIView.id)
        collectionView.register(RecentRecipeCell.self, forCellWithReuseIdentifier: RecentRecipeCell.id)
        collectionView.register(ChefCell.self, forCellWithReuseIdentifier: ChefCell.id)
        return collectionView
    }()
    
    private var dataSource: DataSource!
    private var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let margin = view.layoutMarginsGuide
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
            case let .trending(trend):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeUIView.id, for: indexPath) as? RecipeUIView else { return UICollectionViewCell()}
                return cell
            case let .popular(pop):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HalfRoundImageUIView.id, for: indexPath) as? HalfRoundImageUIView else { return UICollectionViewCell()}
                cell.nameLabel.text = pop.title
                return cell
            case let .recent(rec):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentRecipeCell.id, for: indexPath) as? RecentRecipeCell else { return UICollectionViewCell()}
                cell.label.text = rec.title
                return cell
            case let .chef(che):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCell.id, for: indexPath) as? ChefCell else { return UICollectionViewCell()}
                cell.configure(with: che)
                return cell
            }
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
            items: [
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
            ].map { .trending($0)}),
        MainRow(
            index: MainSection.popular.rawValue,
            title: "Popular category ",
            items: [
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
            ].map { .popular($0)}),
        MainRow(
            index: MainSection.recent.rawValue,
            title: "Recent recipe",
            items: [
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
                RecipeStruct(id: UUID().hashValue, title: "The Best Chili", image: "https://spoonacular.com/recipeImages/715424-312x231.jpg", imageType: "jpg"),
            ].map { .recent($0)}),
        MainRow(
            index: MainSection.chef.rawValue,
            title: "Popular creators",
            items: ["Ify’s Kitchen", "Kathryn Murphy", "Jerome Bell"].map { .chef($0)})
    ]
    
}
