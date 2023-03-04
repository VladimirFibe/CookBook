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
        label.font = .poppinsSemiBold16()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Union")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let ratingLabel: UIButton = {
        let button = UIButton()
        button.setTitle("5.0", for: .normal)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.backgroundColor = .darkGray.withAlphaComponent(0.8)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Bookmark")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius =  16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    private func moreButtonTapped() { print("TAPPED") }
    
    private var firstStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        //backgroundColor = .green
        firstStackView = UIStackView(arrangedSubviews: [nameLabel, moreButton], axis: .horizontal, spacing: 10)
        contentView.addSubview(imageDish)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(firstStackView)
        contentView.addSubview(bookmarkButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageDish.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageDish.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageDish.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageDish.heightAnchor.constraint(equalToConstant: 320),
            
           // moreButton.widthAnchor.constraint(equalToConstant: 20),
            ratingLabel.topAnchor.constraint(equalTo: imageDish.topAnchor, constant: 10),
            ratingLabel.leadingAnchor.constraint(equalTo: imageDish.leadingAnchor, constant: 10),
            ratingLabel.widthAnchor.constraint(equalToConstant: 60),
            ratingLabel.heightAnchor.constraint(equalToConstant: 30),
            
            bookmarkButton.topAnchor.constraint(equalTo: imageDish.topAnchor, constant: 10),
            bookmarkButton.trailingAnchor.constraint(equalTo: imageDish.trailingAnchor, constant: -10),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 32),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 32),
        
            firstStackView.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 15),
            firstStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            firstStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
            
            
        ])
        
    }
    
}
