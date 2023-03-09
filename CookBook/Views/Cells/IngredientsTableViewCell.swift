//
//  IngredientsTableViewCell.swift
//  CookBook
//
//  Created by Ildar Garifullin on 02/03/2023.
//

import UIKit
import Kingfisher

class IngredientsTableViewCell: UITableViewCell {
    
    let recipe = RecipeHTTPClient.shared.getRecipes()[4]
    
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .neutral10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let ingredientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "TestImageIngredient")
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let ingredientLabel: UILabel = {
        let label = UILabel()
        label.text = "Fish"
        label.textColor = .neutral100
        label.font = .poppinsSemiBold16()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let weightIngredientLabel: UILabel = {
        let label = UILabel()
        label.text = "200g"
        label.textColor = .neutral50
        label.font = .poppinsSemiBold16()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with recipe: Recipe) {
        ingredientImageView.kf.setImage(with: URL(string: recipe.extendedIngredients[1].image ?? "No image"))
        ingredientLabel.text = recipe.extendedIngredients[1].name
        weightIngredientLabel.text = String(format: "%0.f", recipe.extendedIngredients[1].measures.metric.amount) + " " + String(recipe.extendedIngredients[1].measures.metric.unitShort)
    }
}

//MARK: - extensions setupViews

extension IngredientsTableViewCell {
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(ingredientImageView)
        addSubview(ingredientLabel)
        addSubview(weightIngredientLabel)
    }
}

//MARK: - extensions setConstraints

extension IngredientsTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ingredientImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ingredientImageView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 16),
            ingredientImageView.widthAnchor.constraint(equalToConstant: 52),
            ingredientImageView.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            ingredientLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ingredientLabel.leadingAnchor.constraint(equalTo: ingredientImageView.trailingAnchor, constant: 16),
            ingredientLabel.widthAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            weightIngredientLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            weightIngredientLabel.leadingAnchor.constraint(equalTo: ingredientLabel.trailingAnchor, constant: 16),
            weightIngredientLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
