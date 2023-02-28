//
//  StartScreenViewController.swift
//  CookBook
//
//  Created by Василий Васильевич on 28.02.2023.
//

import UIKit

class StartScreenViewController: UIViewController {

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
        titleLabel.font = UIFont.boldSystemFont(ofSize: 38)
        titleLabel.textColor = .red
        let attributedString = NSMutableAttributedString(string: "let's cookWithMe")
        let range = (attributedString.string as NSString).range(of: "'s")
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: range)
        titleLabel.attributedText = attributedString
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        getStartedButton.backgroundColor = .red
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @objc func getStartedButtonTapped() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
}
