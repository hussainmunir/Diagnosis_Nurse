//
//  XRayWaitingListVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 30/03/2022.
//

import UIKit

class XRayWaitingListVC: UIViewController {
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout( )
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(XRayWaitingListCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = Color2
        return cv
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
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "Patients List"
        collectionView.dataSource = self
        collectionView.delegate = self
        setUpLayout()
        
        getList()
    }
    
    func setUpLayout() {
        
        let blueView = UIView()
        view.addSubview(blueView)
        blueView.layer.cornerRadius = 20
        blueView.backgroundColor = Color2
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        blueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        blueView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: -5).isActive = true
    
        
    }
    
    func getList() {
        
    }
    
}


extension XRayWaitingListVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! XRayWaitingListCell
        
        cell.nameLabel.text = "Patient"
        
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = Color1.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 60)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
    }
}
