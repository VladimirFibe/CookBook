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
        label.font = .poppins(16, weight: PoppinsWeight.semibold) ?? .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Union")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        
        firstStackView = UIStackView(arrangedSubviews: [nameLabel, moreButton], axis: .horizontal, spacing: 0)
        addSubview(imageDish)
        addSubview(nameLabel)
        addSubview(firstStackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageDish.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageDish.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageDish.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageDish.heightAnchor.constraint(equalToConstant: 320),
            
            moreButton.widthAnchor.constraint(equalToConstant: 15),
            
            firstStackView.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 5),
            firstStackView.centerXAnchor.constraint(equalTo: imageDish.centerXAnchor)
            
        ])
        
    }
    
}
