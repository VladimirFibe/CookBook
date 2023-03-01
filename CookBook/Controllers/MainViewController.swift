import UIKit

class MainViewController: UIViewController {

    var recipeView = SquareRecipe()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(recipeView)
        recipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recipeView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
