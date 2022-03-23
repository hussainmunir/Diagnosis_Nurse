//
//  OrderingX-RaysVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import UIKit

class DiagnosticStudiesVC: UIViewController {
    
    let textView = UITextView(frame: CGRect.zero)
    
    let blueView : UIView = {
        let view = UIView()
        view.backgroundColor = Color2
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nextBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        return button
    }()
    let backBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return button
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Do you want to:"
        label.textAlignment = .center
        label.backgroundColor = Color2
        return label
    }()
    var orderCheck = false
    let orderBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Order X-rays", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(orderBtnAction), for: .touchUpInside)
        return button
    }()
    var skipCheck = false
    let skipBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(skipBtnAction), for: .touchUpInside)
        return button
    }()
    
    let blurView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let alertView : UIView = {
        let view = UIView()
        view.backgroundColor = Color2
        view.layer.cornerRadius = 10
        view.alpha = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let alertLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the X-rays you want to order:"
        label.textAlignment = .center
        return label
    }()
 
    
    let cancelBtn : UIButton = {
        let cancelBtn = UIButton()
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.setTitleColor(.red, for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
        return cancelBtn
    }()
    let doneBtn : UIButton = {
        let doneBtn = UIButton()
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(.blue, for: .normal)
        doneBtn.addTarget(self, action: #selector(doneBtnAction), for: .touchUpInside)

        return doneBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color2
        self.navigationItem.standardAppearance = appearance;
        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
        view.backgroundColor = Color1
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = Color2
        self.navigationItem.title = "Diagnostic Studies"
        setUpLayout()
        alertConstraints()
        alertView.isHidden = true
        blurView.isHidden = true
        
    }
    
    func setUpLayout(){
        
        let bottomView = UIView()
        bottomView.backgroundColor = Color1
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomView.addSubview(nextBtn)
        nextBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        nextBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant:-15).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        bottomView.addSubview(backBtn)
        backBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant:15).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(blueView)
        blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        blueView.bottomAnchor.constraint(equalTo:bottomView.topAnchor ).isActive = true
        
        blueView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor,constant:10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor,constant:-10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        blueView.addSubview(orderBtn)
        orderBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        orderBtn.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor,constant:20).isActive = true
        orderBtn.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor,constant:-20).isActive = true
        orderBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        blueView.addSubview(skipBtn)
        skipBtn.topAnchor.constraint(equalTo: orderBtn.bottomAnchor, constant: 20).isActive = true
        skipBtn.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor,constant:20).isActive = true
        skipBtn.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor,constant:-20).isActive = true
        skipBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func alertConstraints() {
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        //blurview.frame = view.bounds
        view.addSubview(alertView)
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            alertView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.8),
            alertView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.29)
            
        ])
        alertView.addSubview(alertLabel)
        NSLayoutConstraint.activate([
            alertLabel.topAnchor.constraint(equalTo: alertView.topAnchor),
            alertLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
            alertLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            alertLabel.heightAnchor.constraint(equalTo: alertView.heightAnchor, multiplier: 0.2)
        ])
        let alertsTextFieldStackView = UIStackView()
        alertsTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        alertsTextFieldStackView.distribution = .fillEqually
        alertsTextFieldStackView.spacing = 10
        alertView.addSubview(alertsTextFieldStackView)
        NSLayoutConstraint.activate([
            alertsTextFieldStackView.topAnchor.constraint(equalTo: alertLabel.bottomAnchor),
            alertsTextFieldStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor,constant: 10),
            alertsTextFieldStackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor,constant: -10),
            alertsTextFieldStackView.heightAnchor.constraint(equalTo: alertView.heightAnchor, multiplier: 0.5)
        ])
        alertsTextFieldStackView.addArrangedSubview(textView)
        
        let alertButtonStackView = UIStackView()
        alertButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        alertButtonStackView.distribution = .fillEqually
        alertView.addSubview(alertButtonStackView)
        NSLayoutConstraint.activate([
            alertButtonStackView.topAnchor.constraint(equalTo: alertsTextFieldStackView.bottomAnchor),
            alertButtonStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
            alertButtonStackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            alertButtonStackView.heightAnchor.constraint(equalTo: alertView.heightAnchor, multiplier: 0.30)
        ])
        alertButtonStackView.addArrangedSubview(cancelBtn)
        alertButtonStackView.addArrangedSubview(doneBtn)
        
    }
    @objc func orderBtnAction() {
        
        alertView.isHidden = false
        blurView.isHidden = false
        
    }
    
    @objc func skipBtnAction() {
        
        
        
    }
    
    @objc func cancelBtnAction() {
        
        alertView.isHidden = true
        blurView.isHidden = true
        
    }
    
    @objc func doneBtnAction() {
        
        alertView.isHidden = true
        blurView.isHidden = true
        
    }
    
    @objc func nextBtnAction() {
        
    }
    
    
    @objc func backBtnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
