//
//  FavoriteViewController.swift
//  CookBook
//
//  Created by Ildar Garifullin on 03/03/2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    //MARK: - let/var
    
    var recipeUIView = PopularRecipeMainCell()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - flow funcs
    
    //MARK: - public
}

//MARK: - extensions setupViews

extension FavoriteViewController {
    
    private func setupViews() {
        view.addSubview(recipeUIView)
    }
}

//MARK: - extensions setConstraints

extension FavoriteViewController {
    
    private func setConstraints() {
        
        recipeUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recipeUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            recipeUIView.heightAnchor.constraint(equalToConstant: 254)
        ])
    }
}
