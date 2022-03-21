//
//  WaitingListVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import UIKit

class WaitingListVC : UIViewController {
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout( )
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(WaitingListCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = Color2
        return cv
    }()
    
//    let tableView : UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(WaitingListCell.self, forCellReuseIdentifier: "cell")
//        tableView.layer.cornerRadius = 8
//        tableView.backgroundColor = Color2
////        tableView.separatorStyle = .none
//        return tableView
//    }()
    
    let blueView : UIView = {
        let view = UIView()
        view.backgroundColor = Color2
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//    let nextBtn : UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Next", for: .normal)
//        button.layer.cornerRadius = 15
//        button.setTitleColor(Color1, for: .normal)
//        button.backgroundColor = Color2
//        button.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
//        return button
//    }()
//    let backBtn : UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Back", for: .normal)
//        button.layer.cornerRadius = 15
//        button.setTitleColor(Color1, for: .normal)
//        button.backgroundColor = Color2
//        button.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
//        return button
//    }()
    
    
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
    
    func getList() {
            
       
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
    
    
}

extension WaitingListVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WaitingListCell
        cell.nameLabel.text = "Patient"
        cell.selectRoomTextField.placeholder = "Select Room"

        
        
        cell.backgroundColor = Color2
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = Color1.cgColor
        cell.layer.borderWidth = 2
        cell.sizeToFit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 60)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        self.navigationController?.pushViewController(VitalsVC(), animated: true)

    }
   
    
}
//extension WaitingListVC: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if pickerView == self.roomPicker
//               {
//                   return roomNumber.count
//               }
//               else
//               {
//                   return 0
//               }
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView == self.roomPicker
//               {
//                   return "Room # \(roomNumber[row])"
//               }
//               else {
//                   return "No Picker Selected"
//               }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == self.roomPicker
//               {
////            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WaitingListCell
////
////                cell.selectRoomTextField.text = "Room # \(roomNumber[row])"
//            self.selectedString = roomNumber[row]
//            let indexPath = IndexPath(row: row, section: 0)
//            UITableView().reloadRows(at: [indexPath], with: .automatic)
//
//               }
//        
//    }
//}
//
//
