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
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)

        titleLabel.text = "Let's cook with me"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.textColor = .white
        
        view.addSubview(titleLabel)

        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        getStartedButton.backgroundColor = .red
        getStartedButton.layer.cornerRadius = 10
        //        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        view.addSubview(getStartedButton)
        

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -30).isActive = true
        
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        getStartedButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        getStartedButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

//    @objc func getStartedButtonTapped() {
//        let nextViewController = NextViewController()
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
//}
