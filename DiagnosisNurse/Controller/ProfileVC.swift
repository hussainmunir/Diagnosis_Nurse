

import UIKit

class ProfileVC: UIViewController,UITextFieldDelegate {

    
    var name = ""
    var email = ""
    var password = ""
    var phone = ""
    var emergency = ""
    var address = ""
    var npi = ""
    var dea = ""
    
    let profileImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "doctorProfilePic"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }( )
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }( )
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }( )
    let PersonalInformationBtn : UIButton = {
        let button = UIButton( )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Personal Information", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderColor = Color1.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(personalinfoBtnAction), for: .touchUpInside)
        return button
    }( )
    let DocnameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()
    let DocnameTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let DocemailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let DocemailTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        textF.isUserInteractionEnabled = false
        return textF
    }()
    
    let nursePasswordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let nursePasswordTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        textF.isUserInteractionEnabled = false
        return textF
    }()
    let addressLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let addressTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let phoneNoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone No:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let phoneNoTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    
    let emergencyNoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Emergency Contact:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let emergencyNoTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let npiLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NPI:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let npiTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let deaLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DEA:"
         label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }( )
    let deaTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let updateBtn : UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Update", for: .normal)
        bt.backgroundColor = Color1
        bt.layer.cornerRadius = 8
        bt.addTarget(self, action: #selector(updateAction), for: .touchUpInside)
        return bt
    }()
    // MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        NavAppearance.configureWithOpaqueBackground()
        NavAppearance.backgroundColor = Color2
        navigationController?.navigationBar.tintColor = Color2
        navigationController?.navigationBar.standardAppearance = NavAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = NavAppearance
        navigationController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.black
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.barTintColor = Color2
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icons8-settings-24"), style: .plain, target: self, action: #selector(settingBtnAction))
        view.backgroundColor = Color1
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        let topback = UIButton()
        topback.setImage(#imageLiteral(resourceName: "icons8-back-30"), for: .normal)
        topback.setTitleColor(UIColor.black, for: .normal)
        topback.addTarget(self, action: #selector(topBackAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: topback)
        DocnameTextField.delegate = self
        addressTextField.delegate = self
        phoneNoTextField.delegate = self
        npiTextField.delegate = self
        deaTextField.delegate = self
        self.DocnameTextField.placeholder = Global_nurse_name
        self.DocemailTextField.placeholder = Global_nurse_Email
        self.nursePasswordTextField.placeholder = Global_nurse_password
        self.addressTextField.placeholder = Global_nurse_homeAddress
        self.phoneNoTextField.placeholder = String(Global_nurse_phone)
        self.emergencyNoTextField.placeholder = String(Global_nurse_EmergencyContact)
        self.npiTextField.placeholder = String(Global_nurse_npi)
        self.deaTextField.placeholder = String(Global_nurse_dea)
        self.npiTextField.placeholder = Global_nurse_npi
        self.deaTextField.placeholder = Global_nurse_dea
        self.nameLabel.text = Global_nurse_name
        self.emailLabel.text = Global_nurse_Email
        setupLayouts( )
    }
    @objc func topBackAction(){
        self.tabBarController?.selectedIndex = 0
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    private func setupLayouts( ) {
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
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .red
        scrollView.addSubview(contentView)
        contentView.backgroundColor = Color1
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
     //   contentView.heightAnchor.constraint(equalToConstant: 970).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        let blueView = UIView( )
        contentView.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = Color2
        blueView.layer.cornerRadius = 20
        blueView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
      //  blueView.heightAnchor.constraint(equalToConstant: 970).isActive = true
        blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //--------name--------
        blueView.addSubview(DocnameLabel)
        DocnameLabel.topAnchor.constraint(equalTo: blueView.topAnchor,constant: 20).isActive = true
        DocnameLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        DocnameLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        DocnameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(DocnameTextField)
        DocnameTextField.topAnchor.constraint(equalTo: DocnameLabel.bottomAnchor, constant:10).isActive = true
        DocnameTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        DocnameTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        DocnameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //--------email--------
        blueView.addSubview(DocemailLabel)
        DocemailLabel.topAnchor.constraint(equalTo: DocnameTextField.bottomAnchor,constant: 20).isActive = true
        DocemailLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        DocemailLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        DocemailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(DocemailTextField)
        DocemailTextField.topAnchor.constraint(equalTo: DocemailLabel.bottomAnchor, constant:10).isActive = true
        DocemailTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        DocemailTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        DocemailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //--------password--------
        blueView.addSubview(nursePasswordLabel)
        nursePasswordLabel.topAnchor.constraint(equalTo: DocemailTextField.bottomAnchor,constant: 20).isActive = true
        nursePasswordLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nursePasswordLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nursePasswordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(nursePasswordTextField)
        nursePasswordTextField.topAnchor.constraint(equalTo: nursePasswordLabel.bottomAnchor, constant:10).isActive = true
        nursePasswordTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        nursePasswordTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        nursePasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //--------address--------
        blueView.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: nursePasswordTextField.bottomAnchor,constant: 20).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(addressTextField)
        addressTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant:10).isActive = true
        addressTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        addressTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //--------phone no--------
        blueView.addSubview(phoneNoLabel)
        phoneNoLabel.topAnchor.constraint(equalTo: addressTextField.bottomAnchor,constant: 20).isActive = true
        phoneNoLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        phoneNoLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        phoneNoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(phoneNoTextField)
        phoneNoTextField.topAnchor.constraint(equalTo: phoneNoLabel.bottomAnchor, constant:10).isActive = true
        phoneNoTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        phoneNoTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        phoneNoTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        //--------emergency no--------
        blueView.addSubview(emergencyNoLabel)
        emergencyNoLabel.topAnchor.constraint(equalTo: phoneNoTextField.bottomAnchor,constant: 20).isActive = true
        emergencyNoLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        emergencyNoLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        emergencyNoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(emergencyNoTextField)
        emergencyNoTextField.topAnchor.constraint(equalTo: emergencyNoLabel.bottomAnchor, constant:10).isActive = true
        emergencyNoTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        emergencyNoTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        emergencyNoTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        //--------npi--------
        blueView.addSubview(npiLabel)
        npiLabel.topAnchor.constraint(equalTo: emergencyNoTextField.bottomAnchor,constant: 20).isActive = true
        npiLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        npiLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        npiLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(npiTextField)
        npiTextField.topAnchor.constraint(equalTo: npiLabel.bottomAnchor, constant:10).isActive = true
        npiTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        npiTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        npiTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //---dea--------
        blueView.addSubview(deaLabel)
        deaLabel.topAnchor.constraint(equalTo: npiTextField.bottomAnchor,constant: 20).isActive = true
        deaLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        deaLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        deaLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(deaTextField)
        deaTextField.topAnchor.constraint(equalTo: deaLabel.bottomAnchor, constant:10).isActive = true
        deaTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        deaTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        deaTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        blueView.addSubview(updateBtn)
        updateBtn.topAnchor.constraint(equalTo: deaTextField.bottomAnchor, constant:20).isActive = true
        updateBtn.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        updateBtn.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        updateBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        blueView.bottomAnchor.constraint(equalTo: updateBtn.bottomAnchor, constant: 20).isActive = true

    }
    
    @objc func updateAction(){
        print("Update Pressed")
        
        if DocnameTextField.hasText {
            name = DocnameTextField.text ?? Global_nurse_name
        } else {
            name = Global_nurse_name
        }
        
        if DocemailTextField.hasText {
            email = DocemailTextField.text ?? Global_nurse_Email
        }else {
            email = Global_nurse_Email
        }
        if nursePasswordTextField.hasText {
            password = nursePasswordTextField.text ?? Global_nurse_password
        }else {
            password = Global_nurse_password
        }
        if addressTextField.hasText {
            address = addressTextField.text ?? Global_nurse_homeAddress
        }else {
            address = Global_nurse_homeAddress
        }
            
        if phoneNoTextField.hasText {
            phone = phoneNoTextField.text ?? String(Global_nurse_phone)
        }else {
            phone = String(Global_nurse_phone)
        }
        if emergencyNoTextField.hasText {
            emergency = emergencyNoTextField.text ?? String(Global_nurse_EmergencyContact)
        }else {
            emergency = String(Global_nurse_EmergencyContact)
        }
        if npiTextField.hasText {
            npi = npiTextField.text ?? Global_nurse_npi
        }else {
            npi = Global_nurse_npi
        }
        if deaTextField.hasText {
            dea = deaTextField.text ?? Global_nurse_dea
        }else {
            dea = Global_nurse_dea
        }
        
        
        let finalObj: [String:Any] = [
            "name": name,
            "phone": phone,
            "emergencyContact": emergency,
            "password": password,
            "homeAddress": address,
            "npi": npi,
            "dea": dea,
            "designations":"Nurse",
            "companyName":Global_nurse_companyName,
            "gender":Global_nurse_gender
        ]
        
        guard  let url = URL(string: "\(K.mainURL)/api/v1/nurse/updateNurse") else { return }
          var request = URLRequest(url: url)
          request.httpMethod = "PUT"
          request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
          request.addValue(getToken, forHTTPHeaderField: "Authorization")
          request.httpBody = try? JSONSerialization.data(withJSONObject: finalObj, options: [])
          URLSession.shared.dataTask(with: request){data,resp,err in
              print(finalObj)
               if let error = err {
                  print(error)
                   DispatchQueue.main.async {
                      print("ERRRROOOROROROORROOR")

                   }
               }else{
                   DispatchQueue.main.async {
                   print("DATA")
                   guard let data = data else { return }
                   print("DONE")
           //        print(String(data: data, encoding: .utf8))

                   let jsondata  = try? JSONDecoder().decode(NurseInfoModel.self, from: data)
                   alertFunc(vc: self, message: jsondata?.message ?? "Not Successfull")
//                   let msg = (jsondata?.message)!
        //           print(jsondata?.data?.contact?.phone)
//                   print(resp)
                       
                   }
               }
              
          }.resume()
        


}
    
    
    @objc func settingBtnAction( ) {
        print("settings---------")
    }
    @objc func personalinfoBtnAction( ) {
//        self.navigationController?.pushViewController(PersonalInfoVC(), animated: true)
    }

}
