//
//  ReviewsUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class ReviewsUIView: UIView {
    
    //MARK: - let/var
    
    private let ratingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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
        addSubview(ratingIcon)
    }
}

//MARK: - extensions setConstraints

extension ReviewsUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            ratingIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratingIcon.topAnchor.constraint(equalTo: topAnchor),
            ratingIcon.widthAnchor.constraint(equalToConstant: 16),
            ratingIcon.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
