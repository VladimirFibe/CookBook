//
//  RecipeDetailViewController.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    //MARK: - let/var
    
    var videoCreatorInfoStackView = UIStackView()
    var ingredientsStackView = UIStackView()
    
    var videoUIView = VideoUIView()
    var reviewsUIView = ReviewsUIView()
    var creatorProfileUIView = CreatorProfileUIView()
    
    private let idRecipeDetailTableViewCell = "idRecipeDetailTableViewCell"
    
    private let recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "How to make Tasty Fish (point & Kill)"
        label.textColor = .neutral100
        label.font = .poppinsBold24()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = .neutral100
        label.font = .poppinsSemiBold20()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let itemsLabel: UILabel = {
        let label = UILabel()
        label.text = "5 items"
        label.textColor = .neutral50
        label.font = .poppinsRegular14()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let recipeDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    //MARK: - life cycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        setDelegate()
        
        recipeDetailTableView.register(IngredientsTableViewCell.self, forCellReuseIdentifier: idRecipeDetailTableViewCell)
    }
    
    //MARK: - flow funcs
    
    private func setDelegate() {
        recipeDetailTableView.delegate = self
        recipeDetailTableView.dataSource = self
    }
    
    //MARK: - public
}

//MARK: - UITableViewDataSource

extension RecipeDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: idRecipeDetailTableViewCell,
            for: indexPath
        ) as! IngredientsTableViewCell
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension RecipeDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

//MARK: - extensions setupViews

extension RecipeDetailViewController {
    
    private func setupViews() {
        
        view.addSubview(recipeLabel)
        
        videoCreatorInfoStackView = UIStackView(
            arrangedSubviews: [
                videoUIView,
                reviewsUIView,
                creatorProfileUIView
            ],
            axis: .vertical,
            spacing: 16
        )
        view.addSubview(videoCreatorInfoStackView)
        
        ingredientsStackView = UIStackView(
            arrangedSubviews: [
                ingredientsLabel,
                itemsLabel
            ],
            axis: .horizontal,
            spacing: 0
        )
        view.addSubview(videoCreatorInfoStackView)
        
        view.addSubview(ingredientsStackView)
        
        view.addSubview(recipeDetailTableView)
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
        
        NSLayoutConstraint.activate([
            reviewsUIView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            videoCreatorInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            videoCreatorInfoStackView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 25),
            videoCreatorInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            videoCreatorInfoStackView.heightAnchor.constraint(equalToConstant: 320.6)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.widthAnchor.constraint(equalToConstant: 166)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ingredientsStackView.topAnchor.constraint(equalTo: videoCreatorInfoStackView.bottomAnchor, constant: 12),
            ingredientsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ingredientsStackView.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            recipeDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipeDetailTableView.topAnchor.constraint(equalTo: ingredientsStackView.bottomAnchor, constant: 13),
            recipeDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recipeDetailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
