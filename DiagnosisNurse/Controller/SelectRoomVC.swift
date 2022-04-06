//
//  SelectRoomVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 28/03/2022.
//

import UIKit

class SelectRoomVC: UIViewController,UITextFieldDelegate {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var room = String()
    var castRoomNumber = String()
    
    var roomNumberArray = (1...25).map { String($0) }
    var castRoomArray = (1...8).map { String($0) }
    
    var roomPicker = UIPickerView()
    var castPicker = UIPickerView()
    
    let roomLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Location"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let roomTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let castRoomLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Cast Room"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let castRoomTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    
    let nextBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color2
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 15
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        return button
    }()
    let backBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color2
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 15
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return button
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
        self.navigationItem.title = "Select Location"
        roomTextField.delegate = self
        castRoomTextField.delegate = self
        
        setUpLayout()
        
        
        castRoomTextField.inputView = castPicker
        roomTextField.inputView = roomPicker
        
        
        
        
        castPicker.delegate = self
        roomPicker.delegate = self
        castPicker.dataSource = self
        roomPicker.dataSource = self
        
        
        castPicker.tag = 1
        roomPicker.tag = 2
        
        
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // toolbar Cast
        let toolbarCast = UIToolbar()
        toolbarCast.sizeToFit()
        // bar button
        let barbtnCast = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressCast))
        toolbarCast.setItems([flexSpace, barbtnCast], animated: true)
        castRoomTextField.inputAccessoryView = toolbarCast
        
        
        // toolbar room
        let toolbarRoom = UIToolbar()
        toolbarRoom.sizeToFit()
        // bar button
        let barbtnRoom = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressRoom))
        toolbarRoom.setItems([flexSpace, barbtnRoom], animated: true)
        roomTextField.inputAccessoryView = toolbarRoom
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        // Do any additional setup after loading the view.
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func donePressCast(){
        
        castPicker.delegate?.pickerView?(castPicker, didSelectRow: castPicker.selectedRow(inComponent: 0), inComponent: 0)
        castRoomTextField.text = castPicker.delegate?.pickerView?(castPicker, titleForRow: castPicker.selectedRow(inComponent: 0), forComponent: 0)
        //     bmiCast = Float(castRoomTextField.text)
        
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        //       calcBMI()
        
    }
    
    @objc func donePressRoom(){
        
        roomPicker.delegate?.pickerView?(roomPicker, didSelectRow: roomPicker.selectedRow(inComponent: 0), inComponent: 0)
        
        roomTextField.text = roomPicker.delegate?.pickerView?(roomPicker, titleForRow: roomPicker.selectedRow(inComponent: 0), forComponent: 0)
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    
    
    
    
    @objc func dismissKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    func adjustKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 150
        }
        
    }
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.backgroundColor = Color1
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.backgroundColor = Color1
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomView.addSubview(nextBtn)
        nextBtn.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15).isActive = true
        nextBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        bottomView.addSubview(backBtn)
        backBtn.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15).isActive = true
        backBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        let blueView = UIView()
        contentView.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = Color2
        blueView.layer.cornerRadius = 20
        blueView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 950).isActive = true
        blueView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        
        //--------height--------
        blueView.addSubview(roomLabel)
        roomLabel.topAnchor.constraint(equalTo: blueView.topAnchor,constant: 20).isActive = true
        roomLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        roomLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        roomLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(roomTextField)
        roomTextField.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant:10).isActive = true
        roomTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        roomTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        roomTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //--------Cast--------
        blueView.addSubview(castRoomLabel)
        castRoomLabel.topAnchor.constraint(equalTo: roomTextField.bottomAnchor,constant: 20).isActive = true
        castRoomLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        castRoomLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        castRoomLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(castRoomTextField)
        castRoomTextField.topAnchor.constraint(equalTo: castRoomLabel.bottomAnchor, constant:10).isActive = true
        castRoomTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        castRoomTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        castRoomTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    //    @objc func weightFunction() {
    //        castRoomTextField.text = "130 lbs"
    //    }
    
    
    @objc func backBtnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func nextBtnAction() {
        global_RoomNumber = ""
        global_castRoom = ""
        global_RoomNumber = room
        global_castRoom = castRoomNumber
        
        print(global_RoomNumber)
        print(global_castRoom)
        
        self.navigationController?.pushViewController(VitalsVC(), animated: true)
    }
    
}

extension SelectRoomVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.roomPicker
        {
            return roomNumberArray.count
        }
        if pickerView == self.castPicker
        {
            return castRoomArray.count
        }
        else
        {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.roomPicker
        {
            return "Room # \(roomNumberArray[row])"
        }
        if pickerView == self.castPicker
        {
            return "Cast Room # \(castRoomArray[row])"
        }
        else {
            return "No Picker Selected"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.roomPicker
        {
            
            roomTextField.text = "Room # \(roomNumberArray[row])"
            room = "Room # \(roomNumberArray[row])"
        }
        if pickerView == self.castPicker
        {
            
            castRoomTextField.text = "Cast Room # \(castRoomArray[row])"
            castRoomNumber = "Cast Room # \(castRoomArray[row])"
        }
        
    }
}

