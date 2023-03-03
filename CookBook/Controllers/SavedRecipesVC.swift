//
//  SavedRecipesVC.swift
//  CookBook
//
//  Created by Aleksandr Kan on 04/03/23.
//

import UIKit

class SavedRecipesVC: UIViewController {
    
    private let mainLabel: UILabel = {
       let label = UILabel()
        label.text = "Saved recipes"
        label.font = .poppinsBold24()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(mainLabel)
    }
    
    
    
    
}


//MARK: - Setup Constraints

extension SavedRecipesVC {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
        ])
    }
    
}
