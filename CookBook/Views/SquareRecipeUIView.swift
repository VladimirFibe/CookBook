//
//  SquareRecipeUIView.swift
//  CookBook
//
//  Created by Василий Васильевич on 01.03.2023.
//

import SwiftUI

class SquareRecipe: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        let imageView = UIImageView(image: UIImage(named: "Food"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = CGPoint(x: center.x + 100, y: center.y + 100)
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)

        let label = UILabel()
        label.text = "Яичница"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.sizeToFit()
        label.frame.origin = CGPoint(x: imageView.frame.minX, y: imageView.frame.maxY + 20)
        addSubview(label)

        let authorLabel = UILabel()
        authorLabel.text = "By Anthony Bourdain"
        authorLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        authorLabel.textColor = .gray
        authorLabel.sizeToFit()
        authorLabel.frame.origin = CGPoint(x: imageView.frame.minX, y: label.frame.maxY + 10)
        addSubview(authorLabel)
    }
}
