
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
     SettingRow(label: "Website", value: "https://spoonacular.com"),
     SettingRow(label: "Version", value: "1.0")]
    let developersArray: [SettingRow] = [
    SettingRow(label: "", value: "Vladimir Fibe"),
    SettingRow(label: "", value: "Dmitry Lorents"),
    SettingRow(label: "", value: "Abylay Akhmetov"),
    SettingRow(label: "", value: "Vasiliy Dengin")]
    var settingsRowsArray: [ [SettingRow] ]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setConstraints()
        
    }
    
    func setLayout() {
        
        view.backgroundColor = .systemBackground
        settingsRowsArray = [applicationArray, developersArray]
        
        appImageView = UIImageView()
        appImageView.image = UIImage(named: "AppIcon")
        appImageView.clipsToBounds = true
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        appImageView.layer.cornerRadius = 10
        view.addSubview(appImageView)
        
        tableViewSettings = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableViewSettings.translatesAutoresizingMaskIntoConstraints = false
        tableViewSettings.backgroundColor = .systemBackground
        tableViewSettings.delegate = self
        tableViewSettings.dataSource = self
        tableViewSettings.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        view.addSubview(tableViewSettings)
    }
    
    func setConstraints() {
        
        appImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        tableViewSettings.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp_bottomMargin)
        }
    }
}

//MARK: - TableView Delegate

extension SettingsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headersArray[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .poppins(16, weight: .semibold)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
        header.textLabel?.textColor = .neutral50
    }
    
}

//MARK: - TableView DataSource

extension SettingsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsRowsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsRowsArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as? SettingTableViewCell else {return UITableViewCell()}
        let textData = settingsRowsArray[indexPath.section][indexPath.row]
        cell.setTextValues(textData: textData)
        
        
        return cell
    }
    
    
}
