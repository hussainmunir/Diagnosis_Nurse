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

        getWaiting()
        
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
    
    func getWaiting() {
        guard let url = URL(string: "\(K.mainURL)/api/v1/doctors/getCombineWaitingList") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){data,resp,err in
            if let error = err {
                print("******** error *****\(error.localizedDescription)")
            }else{
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)

                let jsonData = try? JSONDecoder().decode(WaitingAllModel.self, from: data)
//                print(jsonData)

                if jsonData?.data != nil {
                    
                    waitingListCommbineArray = (jsonData?.data)!.reversed()
                    
              
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                                
                                
                        for v in waitingListCommbineArray {
                            if v.waitingListType == "problem" {
                            self.getPatientInfo(pid: v.problem!.patientID!)
                            }

                        }
                    }
                  
                }
            }
            
        }.resume()
    }

    // MARK: GET patient name
    
    func getPatientInfo(pid:String){
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/patients/getPatientById/\(pid)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){data,resp,err in
            if let error = err {
                print("******** error *****\(error.localizedDescription)")
            }else{
                guard let data = data else { return }
//                print(data)
                let jsonData = try? JSONDecoder().decode(PatientInfoModel.self, from: data)
//                print("json data-----------",jsonData!)
                global_systemReview_object = jsonData?.data?.reviewSystem
                global_patient_allergies = (jsonData?.data?.allergies)!
             }
            
        }.resume()
    }
    
    
}

extension WaitingListVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return waitingListCommbineArray.count
//        return 4
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WaitingListCell
        if waitingListCommbineArray[indexPath.item].waitingListType == "problem" {
            if waitingListCommbineArray[indexPath.item].problem!.patientName ?? "" != "" {
                cell.timeLabel.text = waitingListCommbineArray[indexPath.item].problem!.createdAt!
                cell.nameLabel.text = "\(waitingListCommbineArray[indexPath.item].problem!.patientName!) is in waiting room"
                cell.typeLabel.text = "Visit Type: New Problem"
                
//                cell.nameLabel.text = "New Problem - \(waitingListCommbineArray[indexPath.item].problem!.patientName!) - \n\(waitingListCommbineArray[indexPath.item].problem?.fullBodyCoordinates ?? [""])"
//                cell.typeLabel.text = "Visit Type: New Problem"
                patient_ID = waitingListCommbineArray[indexPath.item].problem!.patientID!

                }
                else {
                    cell.typeLabel.text = "Visit Type: New Problem"
                    patient_ID = waitingListCommbineArray[indexPath.item].problem!.patientID!
                    cell.nameLabel.text = "Patient is in waiting room"
                }
        }
        if waitingListCommbineArray[indexPath.item].waitingListType == "followUp" {
            if waitingListCommbineArray[indexPath.item].followUp!.patientName ?? "" != "" {
                cell.timeLabel.text = waitingListCommbineArray[indexPath.item].followUp!.createdAt ?? ""
                cell.nameLabel.text = "\(waitingListCommbineArray[indexPath.item].followUp!.patientName!) is in waiting room"
                cell.typeLabel.text = "Visit Type: Follow-Up"
//                cell.nameLabel.text = "Follow Up - \(waitingListCommbineArray[indexPath.item].followUp!.patientName!) - \n\(waitingListCommbineArray[indexPath.item].followUp?.patientInWaitingRoom?.fullBodyCoordinates ?? [""])"
                patient_ID = waitingListCommbineArray[indexPath.item].followUp!.patientId!

                }
                else{
                    cell.typeLabel.text = "Visit Type: Follow-Up"
                    patient_ID = waitingListCommbineArray[indexPath.item].followUp!.patientId!
                    cell.nameLabel.text = "Patient is in waiting room"
                }
        }

        if waitingListCommbineArray[indexPath.item].waitingListType == "operation" {
            if waitingListCommbineArray[indexPath.item].postOp!.patientName ?? "" != "" {
                cell.timeLabel.text = waitingListCommbineArray[indexPath.item].postOp!.createdAt ?? ""
                cell.nameLabel.text = "\(waitingListCommbineArray[indexPath.item].postOp!.patientName!) is in waiting room"
                
                var surgicalHistoryItems = [String]()
                surgicalHistoryItems.removeAll()
                for v in waitingListCommbineArray[indexPath.item].postOp!.surgicalHistory! {
                    surgicalHistoryItems.append("\(v.name!) \(v.code!)")
                }
            
//                cell.typeLabel.text = "Visit Type: Post Operation -"
                
                cell.typeLabel.text = "Visit Type: Post Operation - \n \(surgicalHistoryItems.joined(separator: ", ")) \(waitingListCommbineArray[indexPath.item].postOp!.fullBodyCoordinates!.joined(separator: ", "))"
                
//                cell.nameLabel.text = "Post Operation - \(waitingListCommbineArray[indexPath.item].postOp?.patientName! ?? "") - \n\(waitingListCommbineArray[indexPath.item].postOp?.fullBodyCoordinates ?? [""])"
                patient_ID = waitingListCommbineArray[indexPath.item].postOp!.patientId!

                }
                else{
                    cell.typeLabel.text = "Visit Type: Post Operation"
                    patient_ID = waitingListCommbineArray[indexPath.item].postOp!.patientId!
                    cell.nameLabel.text = "Patient is in waiting room"
                }
        }
 
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = Color1.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        hpi_review_array_index_path = indexPath.item

        if waitingListCommbineArray[indexPath.item].waitingListType == "problem" {
            patient_ID = waitingListCommbineArray[indexPath.item].problem!.patientID!
        self.navigationController?.pushViewController(PatientReviewVC(), animated: true)
        }
        
        else if waitingListCommbineArray[indexPath.item].waitingListType == "followUp" {
            patient_ID = waitingListCommbineArray[indexPath.item].followUp!.patientId!
            self.navigationController?.pushViewController(FollowUpHpiReviewVC(), animated: true)
        }
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
