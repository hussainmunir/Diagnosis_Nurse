//
//  OrderingX-RaysVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import Foundation
import UIKit
import PhotosUI

class DiagnosticStudiesVC: UIViewController, URLSessionDelegate, UITextViewDelegate {
    
    let textViewXRayetail = UITextView(frame: CGRect.zero)
    var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    var VW_overlay: UIView = UIView()
    var pdfUrl : URL?
    
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
        button.setTitle("Done", for: .normal)
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
        button.setTitle("View Problem", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.isHidden = true
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
        doneBtn.addTarget(self, action: #selector(doneBtnAlertAction), for: .touchUpInside)
        
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
        
        if waitingListCommbineArray[hpi_review_array_index_path].waitingListType == "followUp" {
            skipBtn.isHidden = false
        }
        else if waitingListCommbineArray[hpi_review_array_index_path].waitingListType == "operation" {
            skipBtn.isHidden = false
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        tap.cancelsTouchesInView = false
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
     
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 80
        }
        
    }
        @objc func keyboardWillBeHidden(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }

    
    @objc func handleTap() {
        textViewXRayetail.resignFirstResponder() // dismiss keyoard
           }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textViewXRayetail.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

 
    func textViewDidBeginEditing(_ textView: UITextView) {

        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
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
        blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
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
        alertsTextFieldStackView.addArrangedSubview(textViewXRayetail)
        
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
                        perform(#selector(self.pdfviewfunction), with: activityIndicatorView, afterDelay: 0.01)
    }
    
    
    @objc func pdfviewfunction() {
          guard let url = URL(string: "\(K.mainURL)/api/v1/doctors/report/\(problem_id)")else {return}
                 let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
                 let downloadTask = urlSession.downloadTask(with: url)
                 downloadTask.resume()
      }
    
    
    @objc func cancelBtnAction() {
        
        alertView.isHidden = true
        blurView.isHidden = true
        
    }
    
    @objc func doneBtnAction() {
        
        alertView.isHidden = true
        blurView.isHidden = true
        
        print(textViewXRayetail.text!)
        
    }
    
    @objc func nextBtnAction() {
        VW_overlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .white
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: activityIndicatorView.bounds.size.width, height: activityIndicatorView.bounds.size.height)

        activityIndicatorView.center = VW_overlay.center
        VW_overlay.addSubview(activityIndicatorView)
        VW_overlay.center = view.center
        view.addSubview(VW_overlay)

        activityIndicatorView.startAnimating()
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].waitingListType == "problem" {
            perform(#selector(self.problemRoomChecking), with: activityIndicatorView, afterDelay: 0.01)
//            problemRoomChecking()
        }
        else if waitingListCommbineArray[hpi_review_array_index_path].waitingListType == "followUp" {
            perform(#selector(self.followUpRoomChecking), with: activityIndicatorView, afterDelay: 0.01)
//            followUpRoomChecking()
        }
        else if waitingListCommbineArray[hpi_review_array_index_path].waitingListType == "operation" {
            perform(#selector(self.postOpRoomChecking), with: activityIndicatorView, afterDelay: 0.01)
//            postOpRoomChecking()
        }
        
    }
    
    
    @objc func backBtnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func problemRoomChecking() {
        
        
        let innerValue:[String:Any] = [
            //            "doctorId": "6182ac5bb19ea227705bc685",
            "roomNumber" : global_RoomNumber,
//            "castNumber" : global_castRoom,
            "vitals": vitalsDic_nurse
            
        ]
        //        let  parameter =  [
        //            "dignosis": innervalue
        //        ]
        print(innerValue)
        
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/nurse/addPatientRoomProblem/\(doctor_post_problemID)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONSerialization.data(withJSONObject: innerValue, options: [])
        
        URLSession.shared.dataTask(with: request){data,resp,error in
            
            DispatchQueue.main.sync {
                self.activityIndicatorView.stopAnimating()
            }
            if let error = error {
                DispatchQueue.main.async {
                    alertFunc(vc: self, message: error.localizedDescription)
                }
            }else{
                
                DispatchQueue.main.async {
                    alertFunction(vc: self, message: "Vitals has been updated successfully!")
                    
                }
                
                func alertFunction(vc: UIViewController,message: String){

                   let alertControl = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel) { alert in
//                        let alert: Void? =
                        self.navigationController?.popToRootViewController(animated: true)

                    }
                   alertControl.addAction(alertAction)
                   vc.present(alertControl, animated: true, completion: nil)
               }
                
                
            }
            
        }.resume()
        
        
    }
    
    @objc func doneBtnAlertAction() {
        
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
//                perform(#selector(self.finishFunc), with: activityIndicatorView, afterDelay: 1.9)
        
        
        let updLabs : [String:Any] = [

            "name": "X-Ray",
            "date": "\(timeStamp)",
            "description": textViewXRayetail.text ?? "",
            "patientId": patient_ID,
            "doctorId": doctor_ID,
            "patientName":patient_name,
            "byDesignation":"Nurse",
            "progress":"pending",
            "companyName": Global_nurse_companyName
            
            
        ]
        
//        print("images: \(lab_Photos)")
//        print("pdfs: \(lab_docs)")
        
      //  let mediaArray = [image]
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/patients/updatePatientLabs") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        let boundary = generateBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        let dataBody = createDataBody(withParameters: updLabs, media: lab_Photos,media1:lab_docs, boundary: boundary) as Data
        request.httpBody = dataBody
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.sync {
              self.activityIndicatorView.stopAnimating()
              self.VW_overlay.isHidden = true
                lab_Photos.removeAll()
                lab_docs.removeAll()
            }

            if let error = error {
                print("error: \(error)")
            }else{
  
                DispatchQueue.main.async {

                    print(updLabs)
//                    self.navigationController?.pushViewController(ViewController(), animated: true)
                    self.alertView.isHidden = true
                    self.blurView.isHidden = true
                    alertFunc(vc: self, message: "X-Ray has been ordered successfully!")

                }
            }
            
        }.resume()
    }
    func generateBoundary() -> String{
        return "Boundary-\(NSUUID().uuidString)"
    }
    func createDataBody(withParameters params: [String:Any]?, media: [Media]?, media1: [Media1]?, boundary:String) -> NSData {
    
        //let lineBreak = "\r\n"
        let body = NSMutableData()
        
        if let parameters = params {
            for(key,value)in parameters {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        if let media = media {
            for photo in media {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\r\n")
                body.appendString(string: "Content-Type: \(photo.mimeType)\r\n\r\n")
                body.append(photo.data)
                body.appendString(string: "\r\n")
            }
        }
        
        if let media1 = media1 {
            for file in media1 {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(file.key)\"; filename=\"\(file.filename)\"\r\n")
                body.appendString(string: "Content-Type: \(file.mimeType)\r\n\r\n")
                body.append(file.data)
                body.appendString(string: "\r\n")
            }
        }


        body.appendString(string: "--\(boundary)--\r\n")
        
        return body
    }
    
    @objc func followUpRoomChecking() {
        
        let innerValue:[String:Any] = [
            "roomNumber" : global_RoomNumber,
//            "castNumber" : global_castRoom,
            "vitals": vitalsDic_nurse
            
        ]
        //        let  parameter =  [
        //            "dignosis": innervalue
        //        ]
        print(innerValue)
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/nurse/addPatientRoomFollowUp/\(followUp_post_obj_ID)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONSerialization.data(withJSONObject: innerValue, options: [])
        
        URLSession.shared.dataTask(with: request){data,resp,error in
            
            DispatchQueue.main.sync {
                self.activityIndicatorView.stopAnimating()
            }
            if let error = error {
                DispatchQueue.main.async {
                    alertFunc(vc: self, message: error.localizedDescription)
                }
            }else{
                
                DispatchQueue.main.async {
                    alertFunction(vc: self, message: "Vitals has been updated successfully!")
                    
                }
                
                func alertFunction(vc: UIViewController,message: String){

                   let alertControl = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel) { alert in
//                        let alert: Void? =
                        self.navigationController?.popToRootViewController(animated: true)

                    }
                   alertControl.addAction(alertAction)
                   vc.present(alertControl, animated: true, completion: nil)
               }
                
                
            }
            
        }.resume()
        
    }
    
    @objc func postOpRoomChecking() {
        
        let innerValue:[String:Any] = [
            "roomNumber" : global_RoomNumber,
//            "castNumber" : global_castRoom,
            "vitals": vitalsDic_nurse
            
        ]
     
        print(innerValue)
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/nurse/addPatientRoomOperation/\(postOp_post_obj_ID)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(getToken, forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONSerialization.data(withJSONObject: innerValue, options: [])
        
        URLSession.shared.dataTask(with: request){data,resp,error in
            
            DispatchQueue.main.sync {
                self.activityIndicatorView.stopAnimating()
            }
            if let error = error {
                DispatchQueue.main.async {
                    alertFunc(vc: self, message: error.localizedDescription)
                }
            }else{
                
                DispatchQueue.main.async {
                    alertFunction(vc: self, message: "Vitals has been updated successfully!")
                    
                }
                
                func alertFunction(vc: UIViewController,message: String){

                   let alertControl = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel) { alert in
//                        let alert: Void? =
                        self.navigationController?.popToRootViewController(animated: true)

                    }
                   alertControl.addAction(alertAction)
                   vc.present(alertControl, animated: true, completion: nil)
               }
                
            }
            
        }.resume()
    }
}

extension NSMutableData {

    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }

}
//extension
extension DiagnosticStudiesVC : URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.sync {
            activityIndicatorView.stopAnimating()
                    VW_overlay.isHidden = true
        }
        print("File Downloaded Location- ",  location)
        
        guard let url = downloadTask.originalRequest?.url else {
            return
        }
        let docsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationPath = docsPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationPath)
        
        do{
            try FileManager.default.copyItem(at: location, to: destinationPath)
            self.pdfUrl = destinationPath
         
            print("File Downloaded Location - ",  self.pdfUrl ?? "NOT")
            
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    let pdfView = PdfViewVC()
                    pdfView.pdfURL = self.pdfUrl
                    self.navigationController?.pushViewController(pdfView, animated: true)
            }
        }catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
}
