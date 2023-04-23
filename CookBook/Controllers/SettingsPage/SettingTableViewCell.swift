//
//  SettingTableViewCell.swift
//  CookBook
//
//  Created by Дмитрий Лоренц on 22.04.2023.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    
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
        
        contentView.backgroundColor = .systemGray6
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .poppins(16, weight: .regular)
        label.textColor = .neutral50
        contentView.addSubview(label)
        
        valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .right
        valueLabel.font = .poppins(16, weight: .regular)
        contentView.addSubview(valueLabel)
        
    }
    
    private func setConstraints() {
        
        label.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(10)
        }
        
    }
    
    func setTextValues(textData: SettingRow) {
        self.label?.text = textData.label
        self.valueLabel?.text = textData.value
    }

}
