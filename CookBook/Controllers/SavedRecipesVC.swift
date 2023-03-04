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
    
    private lazy var segmentControl: UISegmentedControl = {
       let control = UISegmentedControl(items: ["Video", "Recipe"])
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .primary50
        control.backgroundColor = .clear
        let font: UIFont = .poppinsRegular14() ?? .systemFont(ofSize: 14)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                        NSAttributedString.Key.foregroundColor: UIColor.white],
                                       for: .selected)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                        NSAttributedString.Key.foregroundColor: UIColor.primary30 ?? UIColor.red],
                                       for: .normal)
       // control.addTarget(self, action: <#T##Selector#>, for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .none
        collection.showsVerticalScrollIndicator = false
        collection.bounces = false
        collection.delaysContentTouches = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let idRecipeCell = "idRecipeCell"
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        setupDelegates()
        collectionView.register(SavedRecipeViewCell.self, forCellWithReuseIdentifier: idRecipeCell)
    }
    
    
    private func setupViews() {
        
        
        view.addSubview(mainLabel)
        view.addSubview(segmentControl)
        view.addSubview(collectionView)
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
}


//MARK: - Setup Constraints

extension SavedRecipesVC {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            mainLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            segmentControl.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 35),
            segmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            segmentControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



//MARK: - CollectionView DataSource
extension SavedRecipesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idRecipeCell, for: indexPath) as! SavedRecipeViewCell
        return cell
    }
    
    
}

//MARK: - CollectionView Delegate

extension SavedRecipesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width,
               height: 410)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    
}


