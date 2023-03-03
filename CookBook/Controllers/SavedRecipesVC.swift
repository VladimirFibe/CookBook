//
//  SavedRecipesVC.swift
//  CookBook
//
//  Created by Aleksandr Kan on 04/03/23.
//

import UIKit

class SavedRecipesVC: UIViewController {
    
    private let mainLabel: UILabel = {
       let label = UILabel()
        label.text = "Saved recipes"
        label.font = .poppinsBold24()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
       let control = UISegmentedControl(items: ["Video", "Recipe"])
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .primary50
        control.backgroundColor = .clear
        let font: UIFont = .poppinsRegular12()!
        control.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                        NSAttributedString.Key.foregroundColor: UIColor.white],
                                       for: .selected)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                        NSAttributedString.Key.foregroundColor: UIColor.primary30 ?? UIColor.red],
                                       for: .normal)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        view.addSubview(mainLabel)
        view.addSubview(segmentControl)
    }
    
    
    
    
}


//MARK: - Setup Constraints

extension SavedRecipesVC {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            segmentControl.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 35),
            segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
            
        ])
    }
    
}
