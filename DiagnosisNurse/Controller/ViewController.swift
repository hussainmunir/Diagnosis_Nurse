//
//  ViewController.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import UIKit

class ViewController: UIViewController {

    let topImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "website_logo_transparent_background 1") )
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }( )
    let signInBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color2
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(signInBtnAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }( )
    let createAccountBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = Color2
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(Color1, for: .normal)
         button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
         button.addTarget(self, action: #selector(createAccountBtnAction), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }( )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Color1
        setUpLayouts()
    }

    private func setUpLayouts() {
        let safeArea = view.safeAreaLayoutGuide
        let topView = UIView()
        view.addSubview(topView)
        topView.backgroundColor = Color1
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.6).isActive = true
        
        
        topView.addSubview(topImage)
        topImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        topImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        topImage.topAnchor.constraint(equalTo: topView.topAnchor, constant: 50).isActive = true
        
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.backgroundColor = Color1
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
         bottomView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true

        bottomView.addSubview(signInBtn)
        signInBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15).isActive = true
        signInBtn.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        signInBtn.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.8).isActive = true
        signInBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        bottomView.addSubview(createAccountBtn)
        createAccountBtn.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 15).isActive = true
        createAccountBtn.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        createAccountBtn.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.8).isActive = true
        createAccountBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //---sigin button
    @objc func signInBtnAction() {
        
        let vc = Login()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    //---create account button
    @objc func createAccountBtnAction() {

        
    }
 

}


