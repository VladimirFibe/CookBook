//
//  DetailUIView.swift
//  CookBook
//
//  Created by Ildar Garifullin on 01/03/2023.
//

import UIKit

class VideoUIView: UIView {
    
    //MARK: - let/var
    
    private let fishImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fish")
        imageView.contentMode = .scaleAspectFit
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
        addSubview(fishImage)
        fishImage.addSubview(playButton)
    }
}

//MARK: - extensions setConstraints

extension VideoUIView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            fishImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            fishImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            fishImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fishImage.widthAnchor.constraint(equalToConstant: 343),
            fishImage.heightAnchor.constraint(equalToConstant: 223)
        ])
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: fishImage.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: fishImage.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 48),
            playButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
