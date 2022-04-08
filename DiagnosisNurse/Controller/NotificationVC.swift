
import UIKit

class NotificationVC: UIViewController {

    let tableView = UITableView( )
    // MARK: View Did load
    override func viewDidLoad() {
        super.viewDidLoad()
        NavAppearance.configureWithOpaqueBackground()
        NavAppearance.backgroundColor = Color2
        navigationController?.navigationBar.tintColor = Color2
        navigationController?.navigationBar.standardAppearance = NavAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = NavAppearance
        navigationController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.black
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "Notifications"
        self.navigationController?.navigationBar.barTintColor = Color2
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-settings-24"), style: .plain, target: self, action: #selector(settingBtnAction))
        view.backgroundColor = Color1
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        let topback = UIButton()
        topback.setImage(#imageLiteral(resourceName: "icons8-back-30"), for: .normal)
        topback.setTitleColor(UIColor.black, for: .normal)
        topback.addTarget(self, action: #selector(topBackAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: topback)
        setUpLayout()
    }
    @objc func topBackAction(){
        self.tabBarController?.selectedIndex = 0
    }
    func setUpLayout( ){
        view.addSubview(tableView)
        tableView.backgroundColor = Color1
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        tableView.register(notificationCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorColor = Color1
        tableView.sectionIndexColor = .white
    }
    
    @objc func settingBtnAction( ){
        
    }
    
}
//---Extra Functionality---
extension NotificationVC : UITableViewDataSource,UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView( frame: CGRect(x: 10, y: 0, width:200, height: 50))
        view.backgroundColor = Color1
        let label = UILabel( frame: CGRect(x: 10, y: 0, width:200, height: 50))
        label.textColor = Color2
        label.text = "Yesterday"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(label)
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! notificationCell
        cell.nameLabel.text = "Hassan"
        cell.timeLabel.text = "12:30 PM"
        cell.messageLabel.text = "hello how are you . i am fine"
        cell.layer.cornerRadius = 8
        cell.backgroundColor = Color2
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
