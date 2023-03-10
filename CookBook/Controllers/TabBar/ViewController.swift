import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        setValue(CustomTabBar().self, forKey: "tabBar")
//        guard let tabBar = self.tabBar as? CustomTabBar else { return }

        let home = UINavigationController(rootViewController: MainViewController())
        home.tabBarItem = UITabBarItem(title: nil,
                                       image: UIImage(named: "HomeInactive"),
                                       selectedImage: UIImage(named: "HomeActive")?.withRenderingMode(.alwaysOriginal))
        home.view.backgroundColor = .systemBackground
        
        let bookmark = FavoriteViewController()
        bookmark.tabBarItem = UITabBarItem(title: nil,
                                           image: UIImage(named: "BookmarkInactive"),
                                           selectedImage: UIImage(named: "BookmarkActive")?.withRenderingMode(.alwaysOriginal))
        bookmark.view.backgroundColor = .systemBackground
        
        let notification = RecipeDetailViewController()
        notification.tabBarItem = UITabBarItem(title: nil,
                                               image: UIImage(named: "NotificationInactive"),
                                               selectedImage: UIImage(named: "NotificationActive")?.withRenderingMode(.alwaysOriginal))
        notification.view.backgroundColor = .systemBackground
        
        let profile = SavedRecipesVC()
        profile.tabBarItem = UITabBarItem(title: nil,
                                          image: UIImage(named: "ProfileInactive"),
                                          selectedImage: UIImage(named: "ProfileActive")?.withRenderingMode(.alwaysOriginal))
        profile.view.backgroundColor = .systemBackground
        
        setViewControllers([home, bookmark, notification, profile], animated: true)
    }
}

