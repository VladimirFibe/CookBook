//
//  RecipeDetailViewController.swift
//  CookBook
//
//  Created by Ildar Garifullin on 28/02/2023.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    //MARK: - let/var
    
    private let recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "How to make Tasty Fish (point & Kill)"
        label.textColor = .black
        label.font = .poppinsBold24()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        view.backgroundColor = .red
    }
    
    //MARK: - flow funcs
        
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension RecipeDetailViewController {
    
    private func setupViews() {
        view.addSubview(recipeLabel)
    }
}

//MARK: - extensions setConstraints

extension RecipeDetailViewController {
    
    private func setConstraints() {
        
            NSLayoutConstraint.activate([
                recipeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                recipeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                recipeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ])
        }
    }

