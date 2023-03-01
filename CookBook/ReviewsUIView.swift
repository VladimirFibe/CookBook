//
//  ReviewsUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class ReviewsUIView: UIView {
    
    //MARK: - let/var
    
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
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension ReviewsUIView {
    
    private func setupViews() {
    }
}

//MARK: - extensions setConstraints

extension ReviewsUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
