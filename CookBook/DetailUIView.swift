//
//  DetailUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class DetailUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extensions setupViews

extension DetailUIView {
    
    private func setupViews() {
    }
}

//MARK: - extensions setConstraints

extension DetailUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        ])
    }
}
