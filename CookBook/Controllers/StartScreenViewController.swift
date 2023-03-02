import UIKit

protocol StartScreenViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class StartScreenViewController: UIViewController {

    weak var delegate: StartScreenViewControllerDelegate?
    
    let backgroundImage = UIImageView()
    let getStartedButton = UIButton()
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImage)

        titleLabel.text = "let's cookWithMe"
        titleLabel.font = .poppins(38, weight: .bold)
        titleLabel.textColor = .red
        let attributedString = NSMutableAttributedString(string: "let's cookWithMe")
        let range = (attributedString.string as NSString).range(of: "'s")
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: range)
        titleLabel.attributedText = attributedString
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.titleLabel?.font = .poppins(16, weight: .bold)
        getStartedButton.backgroundColor = .primary50
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(getStartedButton)

        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -30),

            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getStartedButton.widthAnchor.constraint(equalToConstant: 200),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func getStartedButtonTapped() {
        delegate?.didFinishOnboarding()
    }
}
