//
//  SavedRecipeCell.swift
//  CookBook
//
//  Created by Aleksandr Kan on 04/03/23.
//

import UIKit

class SavedRecipeViewCell: UICollectionViewCell {
    
    private let imageDish: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Food")
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "How to make shawarma at home"
        label.font = .poppinsSemiBold16() ?? .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(imageDish)
        addSubview(nameLabel)
       // backgroundColor = .green
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageDish.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageDish.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageDish.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageDish.heightAnchor.constraint(equalToConstant: 320),
            
            nameLabel.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
            
        ])
        
    }
    
}
