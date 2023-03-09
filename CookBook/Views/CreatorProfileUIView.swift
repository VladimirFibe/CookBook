//
//  CreatorProfileUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class CreatorProfileUIView: UIView {
    
    //MARK: - let/var
    
    var creatorProfileStackView = UIStackView()
    var countryStackView = UIStackView()
    
    private let сreatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "CreatorProfile")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let сreatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chef Fregz"
        label.font = .poppinsSemiBold16()
        label.textColor = .neutral100
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let cityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Location")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lagos,"
        label.font = .poppinsRegular14()
        label.textColor = .neutral50
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nigeria"
        label.font = .poppinsRegular14()
        label.textColor = .neutral50
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .primary50
        button.titleLabel?.font = .poppinsSemiBold16()
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: - life cycle funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - flow funcs
    
    @objc private func followButtonTapped() {
        print(RecipeHTTPClient.shared.getRecipes()[4])
        
        print("followButtonTapped")
    }
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension CreatorProfileUIView {
    
    private func setupViews() {
        
        addSubview(сreatorImageView)
        
        countryStackView = UIStackView(
            arrangedSubviews: [
                cityIcon,
                cityNameLabel,
                countryNameLabel
            ],
            axis: .horizontal,
            spacing: 2
        )
        addSubview(countryStackView)
        
        creatorProfileStackView = UIStackView(
            arrangedSubviews: [
                сreatorNameLabel,
                countryStackView
            ],
            axis: .vertical,
            spacing: 4
        )
        addSubview(creatorProfileStackView)
        
        addSubview(followButton)
    }
}

//MARK: - extensions setConstraints

extension CreatorProfileUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            сreatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            сreatorImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            сreatorImageView.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            cityIcon.widthAnchor.constraint(equalToConstant: 16.0),
            cityIcon.heightAnchor.constraint(equalToConstant: 16.0)
        ])
        
        NSLayoutConstraint.activate([
            creatorProfileStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            creatorProfileStackView.leadingAnchor.constraint(equalTo: сreatorImageView.trailingAnchor, constant: 5),
            creatorProfileStackView.topAnchor.constraint(equalTo: topAnchor),
            creatorProfileStackView.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        
        NSLayoutConstraint.activate([
            followButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 84.0),
            followButton.heightAnchor.constraint(equalToConstant: 36.0)
        ])
    }
}
