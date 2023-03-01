import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        let main = UINavigationController(rootViewController: MainViewController())
        let recipe = UIViewController()
        let favorite = UIViewController()
        
        main.view.backgroundColor = .systemBackground
        recipe.view.backgroundColor = .systemBackground
        favorite.view.backgroundColor = .systemBackground
        setViewControllers([main, recipe, favorite], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "doc.plaintext")
        items[1].image = UIImage(systemName: "slider.horizontal.3")
        items[2].image = UIImage(systemName: "heart")
        
        items[0].title = "Main"
        items[1].title = "Recipe"
        items[2].title = "Favorite"
    }
}
