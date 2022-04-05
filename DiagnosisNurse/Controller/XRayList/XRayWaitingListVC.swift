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
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/nurse/getPatientLabs/6182ac5bb19ea227705bc685") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){data,resp,err in
            if let error = err {
                print("******** error *****\(error.localizedDescription)")
            }else{
                guard let data = data else { return }
//                print(String(data: data, encoding: .utf8)!)

                let jsonData = try? JSONDecoder().decode(LabsWaitingModel.self, from: data)
                print(jsonData as Any)

                if jsonData?.data != nil {
                    
                    labsWaitingArray = (jsonData?.data)!.reversed()
                    
              
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                                
                    }
                  
                }
            }
            
        }.resume()
    }
    
}


extension XRayWaitingListVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return labsWaitingArray.count

        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! XRayWaitingListCell
        
        cell.nameLabel.text = "\(labsWaitingArray[indexPath.item].patientName ?? "")\n\(labsWaitingArray[indexPath.item].name ?? "")\n\(labsWaitingArray[indexPath.item].date ?? "")\nStatus: \(labsWaitingArray[indexPath.item].progress ?? "")\nCompany Name: \(labsWaitingArray[indexPath.item].companyName ?? "")"
        
        cell.descriptionLabel.text = labsWaitingArray[indexPath.item].description
        
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = Color1.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        patient_lab_detail_index_path = indexPath.item
//        navigationController?.pushViewController(XRaysListVC(), animated: true)
    }
}
