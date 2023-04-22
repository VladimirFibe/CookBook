//
//  ViewControllerSet.swift
//  CookBook
//
//
//

import UIKit

struct SettingRow {
    let label: String
    let value: String
}

class SettingsVC: UIViewController {

    var appImageView: UIImageView!
    var tableViewSettings: UITableView!
    let headersArray = ["Application", "Developers"]
    let applicationArray: [SettingRow] =
    [SettingRow(label: "Product", value: "Cook Book"),
     SettingRow(label: "Compatability", value: "Iphone"),
     SettingRow(label: "Design", value: "Somebody arabian"),
     SettingRow(label: "Website", value: "https://spoonacular.comhttps://spoonacular.com"),
     SettingRow(label: "Varsion", value: "1.0")]
    let developersArray: [SettingRow] = [
    SettingRow(label: "", value: "Vladimir Fibe"),
    SettingRow(label: "", value: "Dmitry Lorents"),
    SettingRow(label: "", value: "Abylay Akhmetov")]
    let settingsRowsArray: [ [SettingRow] ] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setConstraints()
        
    }
    
    func setLayout() {
        
        view.backgroundColor = .systemBackground
        let settingsRowsArray = [applicationArray, developersArray]
        
        appImageView = UIImageView()
        appImageView.image = UIImage(named: "AppIcon")
        appImageView.clipsToBounds = true
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        appImageView.layer.cornerRadius = 10
        view.addSubview(appImageView)
        
        tableViewSettings = UITableView(frame: CGRect.zero, style: .grouped)
        tableViewSettings.translatesAutoresizingMaskIntoConstraints = false
        tableViewSettings.delegate = self
        tableViewSettings.dataSource = self
    }
    
    func setConstraints() {
        appImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
    }
}

//MARK: - TableView Delegate

extension SettingsVC: UITableViewDelegate {
    
}

//MARK: - TableView DataSource

extension SettingsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
