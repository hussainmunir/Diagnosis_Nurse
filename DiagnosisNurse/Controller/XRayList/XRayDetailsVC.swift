////
////  File.swift
////  DiagnosisNurse
////
////  Created by YamTech on 05/04/2022.
////
//
//
//import UIKit
//
//class XRayDetailsVC: UIViewController,UITextFieldDelegate {
//
//   
//    let nameTitleLable : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Name:"
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.black
//        return label
//    }()
//    
//    let nameLable : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.black
//        return label
//    }()
//    
//    let middleNameLabel : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Middle Name:"
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.black
//        return label
//    }()
//    
//    let lastNameLabel : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Last Name:"
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.black
//        return label
//    }()
//    
//    let suffixLabel : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Suffix:"
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.black
//        return label
//    }()
//    
//    let suffixLabel : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Suffix:"
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = UIColor.black
//        return label
//    }()
//
//    
//    // MARK: View did load
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = Color2
//        self.navigationItem.standardAppearance = appearance;
//        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
//        self.navigationItem.title = "Profile"
//        self.navigationController?.navigationBar.barTintColor = Color2
//        
//       
//        setupLayouts()
//    }
//    
//
//   
//    private func setupLayouts() {
//      
//        
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        
//        let contentView = UIView()
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.backgroundColor = .red
//        scrollView.addSubview(contentView)
//        contentView.backgroundColor = Color1
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//  //      contentView.heightAnchor.constraint(equalToConstant: 1400).isActive = true
//        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//        
//        let blueView = UIView( )
//        contentView.addSubview(blueView)
//        blueView.translatesAutoresizingMaskIntoConstraints = false
//        blueView.backgroundColor = Color2
//        blueView.layer.cornerRadius = 20
//        blueView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
//        blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//        blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//   //     blueView.heightAnchor.constraint(equalToConstant: 1400).isActive = true
//        blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        
//        blueView.addSubview(firstNameLabel)
//        firstNameLabel.topAnchor.constraint(equalTo: blueView.topAnchor,constant: 20).isActive = true
//        firstNameLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        firstNameLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
//        firstNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        
//        blueView.addSubview(firstNameTextField)
//        firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant:10).isActive = true
//        firstNameTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        firstNameTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
//        firstNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        
//        
//     
//      
//        
//    }
//    
//   
//}
//
