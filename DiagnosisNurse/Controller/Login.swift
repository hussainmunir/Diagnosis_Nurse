//
//  Login.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import UIKit

class Login: UIViewController ,UITextFieldDelegate{
    
    var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    var VW_overlay: UIView = UIView()
    
    let logoImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "website_logo_transparent_background 1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }( )
    let emailTitle : UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = Color1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }( )
    let emailTextField : UITextField = {
        let textf = UITextField()
        textf.layer.borderWidth = 2
        textf.layer.borderColor = Color2.cgColor
        textf.layer.cornerRadius = 8
        textf.textColor = UIColor.white
        textf.textAlignment = .center
        textf.autocapitalizationType = .none
        textf.translatesAutoresizingMaskIntoConstraints = false
        return textf
    }()
    let passwordTitle : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = Color1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }( )
    
    let passwordTextField : UITextField = {
        let textf = UITextField( )
        textf.layer.borderWidth = 2
        textf.layer.borderColor = Color2.cgColor
        textf.layer.cornerRadius = 8
        textf.textColor = UIColor.white
        textf.textAlignment = .center
        textf.translatesAutoresizingMaskIntoConstraints = false
        textf.autocapitalizationType = .none
        textf.isSecureTextEntry = true
        return textf
    }()
    let signInBtn : UIButton = {
        let button = UIButton()
        button.backgroundColor = Color2
        button.setTitle("Sign In", for: .normal)
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signInBtnAction), for: .touchUpInside)
        return button
    }()
    let signUpBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Don't have an Account? Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(signUpBtnAction), for: .touchUpInside)
        return button
    }( )
    var rememberCheck = false
    let rememberMebtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Remember Me", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.addTarget(self, action: #selector(rememberMeBtnAction), for: .touchUpInside)
        return button
    }( )
    let forgetPasswordbtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forget Password", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(forgetBtnAction), for: .touchUpInside)
        return button
    }( )
    let rememberAndForgetStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }( )
    var checkCheck = false
    let checkBox : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "white-uncheck"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkBoxBtn), for: .touchUpInside)
        return button
    }()
    
    var authObj:userAuth? = nil
    
    // MARK: VIEW DID LOAD {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color1
        view.addSubview(emailTextField)
        view.addSubview(emailTitle)
        view.addSubview(passwordTextField)
        view.addSubview(passwordTitle)
        view.addSubview(signInBtn)
        view.addSubview(signUpBtn)
        view.addSubview(checkBox)
        view.addSubview(rememberAndForgetStackView)
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        setUpLayouts()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        // Do any additional setup after loading the view.
        view.addGestureRecognizer(tap)
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // MARK: SETUP CONSTRAINTS{
    private func setUpLayouts() {
        
        let safeArea = view.safeAreaLayoutGuide
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4).isActive = true
        
        topView.addSubview(logoImage)
        logoImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        logoImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.5).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        emailTitle.topAnchor.constraint(equalTo:  topView.bottomAnchor,constant:-10).isActive = true
        emailTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40).isActive = true
        emailTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        emailTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let textFieldMiddleView = UIView()
        view.addSubview(textFieldMiddleView)
        textFieldMiddleView.translatesAutoresizingMaskIntoConstraints = false
        textFieldMiddleView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        textFieldMiddleView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        textFieldMiddleView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        textFieldMiddleView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.07).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: textFieldMiddleView.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        passwordTitle.topAnchor.constraint(equalTo: textFieldMiddleView.bottomAnchor, constant: -10).isActive = true
        passwordTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40).isActive = true
        passwordTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        passwordTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        checkBox.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant:5).isActive = true
        checkBox.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 13).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        rememberAndForgetStackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant:5).isActive = true
        rememberAndForgetStackView.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor,constant: 5).isActive = true
        rememberAndForgetStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        rememberAndForgetStackView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        rememberAndForgetStackView.addArrangedSubview(rememberMebtn)
        rememberAndForgetStackView.addArrangedSubview(forgetPasswordbtn)
        
        let signInTopView = UIView()
        view.addSubview(signInTopView)
        signInTopView.translatesAutoresizingMaskIntoConstraints = false
        signInTopView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        signInTopView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        signInTopView.topAnchor.constraint(equalTo: rememberAndForgetStackView.bottomAnchor).isActive = true
        signInTopView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        signInBtn.topAnchor.constraint(equalTo: signInTopView.bottomAnchor).isActive = true
        signInBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 35).isActive = true
        signInBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35).isActive = true
        signInBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        signUpBtn.topAnchor.constraint(equalTo: signInBtn.bottomAnchor,constant:15).isActive = true
        signUpBtn.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25).isActive = true
        signUpBtn.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -25).isActive = true
        signUpBtn.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
    
    // MARK: USER AUTHENTICATION {
        
        @objc private func authDoctor() {
            let params = [
                "email": emailTextField.text!,
                "password": passwordTextField.text!
            ]
    guard  let url = URL(string: "\(K.mainURL)/api/v1/doctors/login") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            URLSession.shared.dataTask(with: request){data,resp,err in
                DispatchQueue.main.sync {
                    self.activityIndicatorView.stopAnimating()
                    self.VW_overlay.isHidden = true
                    
                    // ec2-18-222-128-146.us-east-2.compute.amazonaws.com
                }
                
                if let error = err {
                    DispatchQueue.main.async {
                        alertFunc(vc: self, message: error.localizedDescription)
                    }
                }else{
                    guard let data = data else { return }
                    let jsonData = try? JSONDecoder().decode(userAuth.self, from: data)
//                    print(jsonData)
                  if jsonData != nil {

                    if  jsonData!.token == nil {
                          DispatchQueue.main.async {
                              alertFunc(vc: self, message: "Login Failed")
                          }
                      }else{
                        DispatchQueue.main.sync {
                            authToken = jsonData!.token!
                        }
                          DispatchQueue.main.sync {
                              let waitingListVC = NurseDashboardVC()
                                   let nav = UINavigationController(rootViewController: waitingListVC)
                                   nav.modalPresentationStyle = .fullScreen
                                   self.present(nav, animated: true, completion: nil)
                          }
                      }
                  }else{
                      DispatchQueue.main.async {
                          alertFunc(vc: self, message: "Sorry! found nil")
                      }
                  }
                  

                }
                
            }.resume()
           
        }
        

        
        // MARK:---sign in Button Action
        @objc func signInBtnAction() {
            if emailTextField.text == "" || passwordTextField.text == ""{
                alertFunc(vc: self, message: "Must fill all fields")
            }else{
                VW_overlay = UIView(frame: UIScreen.main.bounds)
                VW_overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
                activityIndicatorView = UIActivityIndicatorView(style: .large)
                activityIndicatorView.color = .white
                activityIndicatorView.frame = CGRect(x: 0, y: 0, width: activityIndicatorView.bounds.size.width, height: activityIndicatorView.bounds.size.height)
                activityIndicatorView.center = VW_overlay.center
                VW_overlay.addSubview(activityIndicatorView)
                VW_overlay.center = view.center
                view.addSubview(VW_overlay)
                activityIndicatorView.startAnimating()
                perform(#selector(self.authDoctor), with: activityIndicatorView, afterDelay: 0.01)
            }
           
        }
    
//    //---sign in Button Action
//    @objc func signInBtnAction() {
//
//        let waitingListVC = NurseDashboardVC()
//             let nav = UINavigationController(rootViewController: waitingListVC)
//             nav.modalPresentationStyle = .fullScreen
//             self.present(nav, animated: true, completion: nil)
//

//        if emailTextField.text == "" || passwordTextField.text == "" {
//            alertFunc(vc: self, message: "Must fill all fields")
//        }else{
//            VW_overlay = UIView(frame: UIScreen.main.bounds)
//            VW_overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
//
//            activityIndicatorView = UIActivityIndicatorView(style: .large)
//            activityIndicatorView.color = .white
//            activityIndicatorView.frame = CGRect(x: 0, y: 0, width: activityIndicatorView.bounds.size.width, height: activityIndicatorView.bounds.size.height)
//
//            activityIndicatorView.center = VW_overlay.center
//            VW_overlay.addSubview(activityIndicatorView)
//            VW_overlay.center = view.center
//            view.addSubview(VW_overlay)
//
//            activityIndicatorView.startAnimating()
//            perform(#selector(self.authPatient), with: activityIndicatorView, afterDelay: 0.01)
//        }
        
//    }
    //---sign up button action
    @objc func signUpBtnAction() {
        //        let signUpVC = SignUpFirstVC()
        //        let nav = UINavigationController(rootViewController: signUpVC)
        //        nav.modalPresentationStyle = .fullScreen
        //        self.present(nav, animated: true, completion: nil)
    }
    //---remember me button action
    @objc func rememberMeBtnAction() {
        if rememberCheck == false{
            checkBox.setBackgroundImage(UIImage(named: "white-check"), for: .normal)
            checkCheck = true
            rememberCheck = true
            //            tokencheck = true
        }else{
            checkBox.setBackgroundImage(UIImage(named: "white-uncheck"), for: .normal)
            checkCheck = false
            rememberCheck = false
            //            tokencheck = false
        }
    }
    //---forget password button action
    @objc func forgetBtnAction() {
        
    }
    
    @objc func checkBoxBtn() {
        if checkCheck == false{
            checkBox.setBackgroundImage(UIImage(named: "white-check"), for: .normal)
            checkCheck = true
            rememberCheck = true
            //            tokencheck = true
            
        }
        else {
            checkBox.setBackgroundImage(UIImage(named: "white-uncheck"), for: .normal)
            checkCheck = false
            rememberCheck = false
            //            tokencheck = false
        }
        
    }
    
    // MARK: patient authentication {
    @objc private func authPatient() {
        
//      self.navigationController?.pushViewController(WaitingListVC(), animated: true)

        
    }
    
    
}


