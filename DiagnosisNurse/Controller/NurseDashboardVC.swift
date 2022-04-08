//
//  NurseDashboardVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 23/03/2022.
//

import UIKit

class NurseDashboardVC: UIViewController {

    
    let profileImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "doctorProfilePic"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let waitingListBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Patient Waiting List", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(waitingListBtnAction), for: .touchUpInside)
        return button
    }()
    let pendingNotesBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pending Notes", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
//        button.addTarget(self, action: #selector(pendingNotesAction), for: .touchUpInside)
        return button
    }()
    let xrayWaitingBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X-Ray Waiting List", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(xrayWaitingBtnAction), for: .touchUpInside)
        return button
    }()
    
    let labsBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Patient Diagnostics", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
//        button.addTarget(self, action: #selector(labsBtnAction), for: .touchUpInside)
        return button
    }()
    
    let CompleteNoteBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Completed Notes", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
//        button.addTarget(self, action: #selector(completedNotesBtnAction), for: .touchUpInside)
        return button
    }()
    let signOutBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Out", for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
//        button.addTarget(self, action: #selector(signOutBtnAction), for: .touchUpInside)
        return button
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       self.tabBarController?.tabBar.isHidden = false
     }
    
    //MARK:VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color2
        self.navigationItem.standardAppearance = appearance;
        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
        self.navigationItem.title = "Profile"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.tabBarController?.tabBar.isHidden = false
        self.hidesBottomBarWhenPushed = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-settings-24"), style: .plain, target: self, action: #selector(settingBtnAction))
        view.backgroundColor = Color1
        
        setupLayouts()
        
        if tokencheck == true {
            UserDefaults.standard.setValue(authToken, forKeyPath: "token")
            getToken = UserDefaults.standard.string(forKey: "token")!
        }else{
            if authToken == ""{
                getToken = UserDefaults.standard.string(forKey: "token")!
            }else{
                getToken = authToken
            }
        }
        getDoctorInfo()
                
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func getDoctorInfo(){
        guard let url = URL(string: "\(K.mainURL)/api/v1/nurse/getNurse") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(getToken, forHTTPHeaderField: "authorization")
        print(getToken)
        URLSession.shared.dataTask(with: request){data,resp,err in
            if let error = err {
                print("******** error *****\(error.localizedDescription)")
            }else{
                guard let data = data else { return }
                do{
                    let jsonData = try JSONDecoder().decode(NurseInfoModel.self, from: data)
                    print(jsonData)
                   if jsonData != nil {
                      
                        DispatchQueue.main.async {
                          
                            Global_nurse_Id = (jsonData.data?._id) ?? ""
                            Global_nurse_Email = (jsonData.data?.email) ?? ""
                             Global_nurse_homeAddress = (jsonData.data?.homeAddress) ?? ""
                             Global_nurse_name = (jsonData.data?.name) ?? ""
                             Global_nurse_password = (jsonData.data?.password) ?? ""
                             Global_nurse_phone = (jsonData.data?.phone) ?? 0
                            Global_nurse_EmergencyContact = (jsonData.data?.emergencyContact ?? 0)
                            Global_nurse_npi = String((jsonData.data?.npi) ?? "")
                            Global_nurse_dea = String((jsonData.data?.dea) ?? "")
                            Global_nurse_companyName = String((jsonData.data?.companyName) ?? "")
                            Global_nurse_gender = String((jsonData.data?.gener) ?? "")
                            
                            self.emailLabel.text = Global_nurse_Email
                            self.nameLabel.text = Global_nurse_name
                            print(Global_nurse_companyName)
                        }
                    }else{
                        DispatchQueue.main.async {
                            alertFunc(vc: self, message: "Sorry! No response from server")
                        }
                    }
                }catch(let e){
                    print(e)
                }
                   
            }
            
        }.resume()
    }
    
    
    private func setupLayouts() {
        let topView = UIView()
        view.addSubview(topView)
        topView.backgroundColor = Color2
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13).isActive = true
        
        topView.addSubview(profileImage)
        profileImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10).isActive = true
        profileImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.7).isActive = true
        
            let stackView = UIStackView()
            topView.addSubview(stackView)
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
            stackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
            stackView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.6).isActive = true
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(emailLabel)
        
           let centerView = UIView( )
           view.addSubview(centerView)
           centerView.translatesAutoresizingMaskIntoConstraints = false
           centerView.layer.cornerRadius = 20
           centerView.backgroundColor = Color2
           centerView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
           centerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-10).isActive = true
           centerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
           centerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
        let buttonStackView = UIStackView( )
        centerView.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -20).isActive = true
        buttonStackView.heightAnchor.constraint(equalTo: centerView.heightAnchor, multiplier: 0.75).isActive = true
        
        let emptyView1 = UIView()
        let emptyView2 = UIView()
        let emptyView3 = UIView()
        let emptyView4 = UIView()
        let emptyView5 = UIView()
        let emptyView6 = UIView()
        let emptyView7 = UIView()
        
        buttonStackView.addArrangedSubview(waitingListBtn)
        buttonStackView.addArrangedSubview(emptyView1)
        buttonStackView.addArrangedSubview(xrayWaitingBtn)
        buttonStackView.addArrangedSubview(emptyView2)
        buttonStackView.addArrangedSubview(signOutBtn)
        buttonStackView.addArrangedSubview(emptyView3)
        buttonStackView.addArrangedSubview(emptyView4)
        buttonStackView.addArrangedSubview(emptyView5)
        buttonStackView.addArrangedSubview(emptyView6)
        buttonStackView.addArrangedSubview(emptyView7)
//        buttonStackView.addArrangedSubview(labsBtn)
//        buttonStackView.addArrangedSubview(emptyView3)
//        buttonStackView.addArrangedSubview(pendingNotesBtn)
//        buttonStackView.addArrangedSubview(emptyView4)
//        buttonStackView.addArrangedSubview(CompleteNoteBtn)
//        buttonStackView.addArrangedSubview(emptyView5)
//        buttonStackView.addArrangedSubview(signOutBtn)
        
    }

    @objc func settingBtnAction() {
        print("settings---------")
    }
    @objc func waitingListBtnAction() {
        self.navigationController?.pushViewController(WaitingListVC(), animated: true)

    }
    @objc func pendingNotesAction() {
        
    }
    @objc func xrayWaitingBtnAction() {
        self.navigationController?.pushViewController(XRayWaitingListVC(), animated: true)
 
    }
    
    @objc func labsBtnAction() {
        
    }
    @objc func completedNotesBtnAction() {
//        self.navigationController?.pushViewController(CombinedCompletedNotesVC(), animated: true)

    }
  
    
    @objc func signOutBtnAction() {
        UserDefaults.standard.removeObject(forKey: "token")
        let loginvc = ViewController()
        loginvc.modalPresentationStyle = .fullScreen
        present(loginvc, animated: true, completion: nil)
    }

}
