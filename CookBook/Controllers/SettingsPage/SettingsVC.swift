//
//  ViewControllerSet.swift
//  CookBook
//
//
//

import UIKit

class SettingsVC: UIViewController {

    var appImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setConstraints()
        
    }
    
    func setLayout() {
        
        view.backgroundColor = .systemBackground
        
        appImageView = UIImageView()
        appImageView.image = UIImage(named: "AppIcon")
        appImageView.clipsToBounds = true
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        appImageView.layer.cornerRadius = 10
        view.addSubview(appImageView)
    }
    
    func setConstraints() {
        appImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
    }
}

