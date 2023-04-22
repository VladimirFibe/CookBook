//
//  SettingsVC.swift
//  CookBook
//
//  Created by Дмитрий Лоренц on 22.04.2023.
//

import UIKit
import SnapKit

class SettingsVC: ViewController {
    
    var appImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setConstraints()
        
    }
    
    func setLayout() {
        view.backgroundColor = .systemBackground
        
        appImageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 300, height: 300))
        appImageView.image = UIImage(named: "AppIcon")
        appImageView.clipsToBounds = true
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        appImageView.layer.cornerRadius = 10
        view.addSubview(appImageView)
    }
    
    func setConstraints() {
        appImageView.snp.makeConstraints { make in
            //            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(300)
        }
        
    }
}
