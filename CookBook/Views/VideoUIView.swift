//
//  DetailUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class VideoUIView: UIView {
    
    //MARK: - let/var
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "Fish")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "PlayButton")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(VideoUIView.self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
    
    //MARK: - public
    
}

//MARK: - extensions setupViews

extension VideoUIView {
    
    private func setupViews() {
        addSubview(backgroundImage)
        backgroundImage.addSubview(playButton)
    }
}

//MARK: - extensions setConstraints

extension VideoUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 223)
        ])
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 48),
            playButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
