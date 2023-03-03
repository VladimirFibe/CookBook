import UIKit

class MainViewController: UIViewController {

    var recipeView = RoundImageUIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .success10
        view.addSubview(recipeView)
        recipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recipeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            recipeView.widthAnchor.constraint(equalToConstant: 124),
            recipeView.heightAnchor.constraint(equalToConstant: 190)
        ])
    }
}
