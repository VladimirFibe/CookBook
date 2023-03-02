//
//  ReviewsUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

//изменить размер иконки

class ReviewsUIView: UIView {
    
    //MARK: - let/var
    
    var reviewsStackView = UIStackView()
    
    private let ratingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4,5"
        label.textColor = .black
        label.font = .poppinsSemiBold14()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let reviewsLabel: UILabel = {
        let label = UILabel()
        label.text = "(300 Reviews)"
        label.textColor = .systemGray
        label.font = .poppinsRegular14()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
    
    @objc private func ratingButtonTapped() {
            print("ratingButtonTapped")
        }
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension ReviewsUIView {
    
    private func setupViews() {
        
        reviewsStackView = UIStackView(
            arrangedSubviews: [
                ratingIcon,
                ratingLabel,
                reviewsLabel
            ],
            axis: .horizontal,
            spacing: 4,
            distribution: .fill
        )
        
        addSubview(reviewsStackView)
    }
}

//MARK: - extensions setConstraints

extension ReviewsUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            reviewsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewsStackView.topAnchor.constraint(equalTo: topAnchor),
            reviewsStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
