//
//  SettingsTableViewCell.swift
//  CookBook
//
//  Created by Дмитрий Лоренц on 22.04.2023.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    private var label: UILabel!
    private var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupOutlets()
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    private func setupOutlets() {
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .poppins(16, weight: .regular)
        contentView.addSubview(label)
        
        valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .right
        valueLabel.font = .poppins(16, weight: .regular)
        contentView.addSubview(valueLabel)
        
    }
    
    private func setConstraints() {
        
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
            
            valueLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(8)
                make.trailing.equalToSuperview().inset(-8)
            }
        }
    }
    
    func setTextValues(label: String, value: String) {
        self.label?.text = "label"
        self.valueLabel?.text = "value"
    }

}
