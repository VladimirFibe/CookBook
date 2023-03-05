//
//  HalfRoundImageUIView.swift
//  CookBook
//
//  Created by Василий Васильевич on 05.03.2023.
//

import UIKit

class HalfRoundImageUIView: UICollectionViewCell {

    let secondImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "BackgroundHalfRoundImageUIView")?.withTintColor(UIColor(named: "Neutral10")!))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let circleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let unionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Union2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Food"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 55
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "Ifly's Kitchen"
        label.font = .poppins(14, weight: .semibold)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = .poppins(12, weight: .regular)
        label.textColor = UIColor(named: "Neutral30")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    let minutesLabel: UILabel = {
        let label = UILabel()
        label.text = "5 min"
        label.font = .poppins(12, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [secondImageView, imageView, label])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

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
        secondImageView.addSubview(circleImageView)
        circleImageView.addSubview(unionImageView)
        secondImageView.addSubview(minutesLabel)
        secondImageView.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            secondImageView.topAnchor.constraint(equalTo: imageView.centerYAnchor),
            secondImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            secondImageView.widthAnchor.constraint(equalToConstant: 150),
            secondImageView.heightAnchor.constraint(equalToConstant: 176),
            imageView.widthAnchor.constraint(equalToConstant: 110),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            circleImageView.trailingAnchor.constraint(equalTo: secondImageView.trailingAnchor, constant: -11),
            circleImageView.bottomAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: -11),
            unionImageView.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor),
            unionImageView.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor),
            unionImageView.widthAnchor.constraint(equalToConstant: 10.96),
            unionImageView.heightAnchor.constraint(equalToConstant: 13.67),
            timeLabel.leadingAnchor.constraint(equalTo: secondImageView.leadingAnchor, constant: 12),
            timeLabel.bottomAnchor.constraint(equalTo: minutesLabel.topAnchor, constant: -4),
            minutesLabel.leadingAnchor.constraint(equalTo: secondImageView.leadingAnchor, constant: 12),
            minutesLabel.bottomAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: -11)
        ])
    }
}
