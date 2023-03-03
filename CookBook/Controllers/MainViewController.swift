import UIKit

enum MainItem: Hashable {
    case trending(Int)
    case popular(String)
    case recent
    case chef(Double)
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

final class MainViewModel {
    
}
private typealias DataSource = UICollectionViewDiffableDataSource<MainRow, MainItem>
private typealias Snapshot = NSDiffableDataSourceSnapshot<MainRow, MainItem>
class MainViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .rowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RecentRecipeCell.self, forCellWithReuseIdentifier: RecentRecipeCell.id)
        return collectionView
    }()
    
    private var dataSource: DataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .success10
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: 124),
            collectionView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        configureDataSouce()
    }
    
    private func configureDataSouce() {
//        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
//            
//        }
    }
}
