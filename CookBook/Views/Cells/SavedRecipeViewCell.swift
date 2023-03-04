//
//  SavedRecipeCell.swift
//  CookBook
//
//  Created by Aleksandr Kan on 04/03/23.
//

import UIKit

class SavedRecipeViewCell: UICollectionViewCell {
    
    private let label: UILabel = {
       let test = UILabel()
        test.text = "TEST"
        test.textColor = .red
        test.translatesAutoresizingMaskIntoConstraints = false
        return test
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        addSubview(label)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
}
