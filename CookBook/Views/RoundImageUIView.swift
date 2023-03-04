//
//  RoundImageUIView.swift
//  CookBook
//
//  Created by Василий Васильевич on 03.03.2023.
//

import SwiftUI

class RoundImageUIView: UICollectionViewCell {

    let imageView = UIImageView(image: UIImage(named: "Food"))
    let label = UILabel()
    let authorLabel = UILabel()

    lazy var stack = UIStackView(arrangedSubviews: [imageView, label, authorLabel])
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        contentView.addSubview(stack)

        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 55
        imageView.layer.masksToBounds = true

        label.text = "Ifly's Kitchen"
        label.font = .poppins(12, weight: .semibold)
        label.numberOfLines = 2
        label.textColor = .label

        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(authorLabel)

        NSLayoutConstraint.activate([
            stack.widthAnchor.constraint(equalToConstant: 124),
            imageView.widthAnchor.constraint(equalToConstant: 110),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
