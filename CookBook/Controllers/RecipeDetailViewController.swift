//
//  RecipeDetailViewController.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    //MARK: - let/var
    
    var videoUIView = VideoUIView()
    var reviewsUIView = ReviewsUIView()
    
    private let recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "How to make Tasty Fish (point & Kill)"
        label.textColor = .black
        label.font = .poppinsBold24()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
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

extension RecipeDetailViewController {
    
    private func setupViews() {
        view.addSubview(recipeLabel)
        recipeLabel.addSubview(videoUIView)
    }
}

//MARK: - extensions setConstraints

extension RecipeDetailViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            recipeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            recipeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            recipeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19)
        ])
        
        videoUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            videoUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            videoUIView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: -16),
            videoUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19)
        ])
        
        
    }
}
