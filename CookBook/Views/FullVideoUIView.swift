//
//  FullVideoUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 03/03/2023.
//

import UIKit

class FullVideoUIView: UIView {
    
    //MARK: - let/var
    
    var reviewsStackView = UIStackView()
    
    private let testImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "TestImageSharwama")
        imageView.contentMode = .scaleAspectFill
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
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
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
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension FullVideoUIView {
    
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
    }
}

//MARK: - extensions setConstraints

extension FullVideoUIView {
    
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
    }
}
