//
//  RecipeUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 03/03/2023.
//

import UIKit

class RecipeUIView: UIView {
    
    //MARK: - let/var
    
    var reviewsStackView = UIStackView()
    var dishNameStackView = UIStackView()
    var creatorProfileStackView = UIStackView()
    
    private let testImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "TestImageSharwama")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "PlayButton")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let reviewsUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutral50
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let ratingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4,5"
        label.textColor = .white
        label.font = .poppinsSemiBold14()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Bookmark")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let timesUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutral50
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let timesLabel: UILabel = {
        let label = UILabel()
        label.text = "2:00"
        label.textColor = .white
        label.font = .poppinsRegular12()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let dishNameLabel: UILabel = {
        let label = UILabel()
        label.text = "How to sharwama at home"
        label.textColor = .neutral100
        label.font = .poppinsSemiBold14()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "Union")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let сreatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "Creator")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let сreatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "By Zeelicious foods"
        label.font = .poppinsRegular12()
        label.textColor = .neutral50
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
    
    @objc private func playButtonTapped() {
        print("playButtonTapped")
    }
    
    @objc private func bookmarkButtonTapped() {
        print("bookmarkButtonTapped")
    }
    
    @objc private func moreButtonTapped() {
        print("moreButtonTapped")
    }
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension RecipeUIView {
    
    private func setupViews() {
        addSubview(testImage)
        
        testImage.addSubview(playButton)
        testImage.addSubview(reviewsUIView)
        
        reviewsStackView = UIStackView(
            arrangedSubviews: [
                ratingIcon,
                ratingLabel
            ],
            axis: .horizontal,
            spacing: 4
        )
        reviewsUIView.addSubview(reviewsStackView)
        
        testImage.addSubview(bookmarkButton)
        
        testImage.addSubview(timesUIView)
        timesUIView.addSubview(timesLabel)
        
        dishNameStackView = UIStackView(
            arrangedSubviews: [
                dishNameLabel,
                moreButton
            ],
            axis: .horizontal,
            spacing: 0
        )
        addSubview(dishNameStackView)
        
        creatorProfileStackView = UIStackView(
            arrangedSubviews: [
                сreatorImageView,
                сreatorNameLabel
            ],
            axis: .horizontal,
            spacing: 8
        )
        addSubview(creatorProfileStackView)
    }
}

//MARK: - extensions setConstraints

extension RecipeUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            testImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            testImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            testImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            testImage.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: testImage.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: testImage.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 48),
            playButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            reviewsUIView.leadingAnchor.constraint(equalTo: testImage.leadingAnchor, constant: 8),
            reviewsUIView.topAnchor.constraint(equalTo: testImage.topAnchor,constant: 8),
            reviewsUIView.widthAnchor.constraint(equalToConstant: 58),
            reviewsUIView.heightAnchor.constraint(equalToConstant: 27.6)
        ])
        
        NSLayoutConstraint.activate([
            ratingIcon.widthAnchor.constraint(equalToConstant: 12),
            ratingIcon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        NSLayoutConstraint.activate([
            reviewsStackView.centerXAnchor.constraint(equalTo: reviewsUIView.centerXAnchor),
            reviewsStackView.centerYAnchor.constraint(equalTo: reviewsUIView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bookmarkButton.trailingAnchor.constraint(equalTo: testImage.trailingAnchor, constant: -8),
            bookmarkButton.topAnchor.constraint(equalTo: testImage.topAnchor,constant: 8),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 32),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            timesUIView.trailingAnchor.constraint(equalTo: testImage.trailingAnchor, constant: -8),
            timesUIView.bottomAnchor.constraint(equalTo: testImage.bottomAnchor, constant: -8),
            timesUIView.widthAnchor.constraint(equalToConstant: 41),
            timesUIView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            timesLabel.centerXAnchor.constraint(equalTo: timesUIView.centerXAnchor),
            timesLabel.centerYAnchor.constraint(equalTo: timesUIView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dishNameLabel.widthAnchor.constraint(equalToConstant: 220),
            dishNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            dishNameStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dishNameStackView.topAnchor.constraint(equalTo: testImage.bottomAnchor, constant: 12),
            dishNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            сreatorImageView.widthAnchor.constraint(equalToConstant: 32),
            сreatorImageView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            creatorProfileStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creatorProfileStackView.topAnchor.constraint(equalTo: dishNameStackView.bottomAnchor, constant: 12),
            creatorProfileStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
}
