import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBar.items?[0].title = ""
    }
    
    private func configureUI() {
        setValue(CustomTabBar().self, forKey: "tabBar")
        guard let tabBar = self.tabBar as? CustomTabBar else { return }
        
        tabBar.didTabButton = {
            let createRecipe = CreateRecipeViewController()
            self.navigationController?.pushViewController(createRecipe, animated: true)
        }
        
        tabBar.tintColor = .primary30
        
        let home = UINavigationController(rootViewController: MainViewController())
        let homeInactiveImage = UIImage(named: "HomeInactive")
        let homeActiveImage = UIImage(named: "HomeActive")?.withRenderingMode(.alwaysOriginal)
        let homeItem = UITabBarItem(title: nil, image: homeInactiveImage, selectedImage: homeActiveImage)
        home.tabBarItem = homeItem
        homeItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        homeItem.title = nil
        home.view.backgroundColor = .systemBackground
        
        let bookmark = SavedRecipesVC()
        let bookmarkItem =  UITabBarItem(title: nil,image: UIImage(named: "BookmarkInactive"),selectedImage: UIImage(named: "BookmarkActive")?.withRenderingMode(.alwaysOriginal))
        bookmarkItem.imageInsets = UIEdgeInsets(top: 11, left: -15, bottom: -11, right: 15)
        bookmark.tabBarItem = bookmarkItem
        bookmark.view.backgroundColor = .systemBackground
        
        let toBuy = UIViewController()
        let toBuyItem = UITabBarItem(title: nil,image: UIImage(named: "NotificationInactive"), selectedImage: UIImage(named: "NotificationActive"))
        toBuyItem.imageInsets = UIEdgeInsets(top: 10, left: 15, bottom: -10, right: -15)
        toBuy.tabBarItem = toBuyItem
        toBuy.view.backgroundColor = .systemBackground
        
        let profile = UIViewController()
        let profileItem = UITabBarItem(title: "", image: UIImage(named: "ProfileInactive"),selectedImage: UIImage(named: "ProfileActive")?.withRenderingMode(.alwaysOriginal))
        profileItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -5, right: 0)
        profile.tabBarItem = profileItem
        profile.view.backgroundColor = .systemBackground
        
        setViewControllers([home, bookmark, toBuy, profile], animated: true)
        
    }
}

