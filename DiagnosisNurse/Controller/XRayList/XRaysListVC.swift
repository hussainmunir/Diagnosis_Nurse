//
//  XRay.swift
//  DiagnosisNurse
//
//  Created by YamTech on 30/03/2022.
//

import UIKit

class XRaysListVC: UIViewController {
    
   var patientLabsListArray = labsWaitingArray[patient_lab_detail_index_path]

    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout( )
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PatientLabCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = Color2
        return cv
    }()
    
   
    
    // MARK: View did load
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color2
        self.navigationItem.standardAppearance = appearance;
        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
        view.backgroundColor = Color1
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "Labs"
        collectionView.dataSource = self
        collectionView.delegate = self
        setUpLayout()
    }

    func setUpLayout(){
        
        let BlueView = UIView()
        view.addSubview(BlueView)
        BlueView.layer.cornerRadius = 20
        BlueView.backgroundColor = Color2
        BlueView.translatesAutoresizingMaskIntoConstraints = false
        BlueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        BlueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        BlueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        BlueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        BlueView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: BlueView.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: BlueView.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: BlueView.trailingAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: BlueView.bottomAnchor, constant: -80).isActive = true
        
  
        
    }
    
    @objc func addnewAction() {
//    self.navigationController?.pushViewController(LabsVC(), animated: true)

    }
    
   
    
}

extension XRaysListVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return patientLabsListArray.name?.count ?? 0
        
        
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PatientLabCell
        
        cell.nameLabel.text = patientLabsListArray.name
        cell.dateLabel.text = patientLabsListArray.date
        cell.progressLabel.text = "Status: \(patientLabsListArray.progress ?? "")"
        
    
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = Color1.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        
    }
    
}
