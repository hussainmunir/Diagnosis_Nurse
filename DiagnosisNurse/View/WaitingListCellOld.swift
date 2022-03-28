////
////  WaitingListCell.swift
////  DiagnosisNurse
////
////  Created by YamTech on 21/03/2022.
////
//
//import Foundation
//import UIKit
//
//class WaitingListCell : UICollectionViewCell, UITextFieldDelegate {
//
////    var roomNumber = (1...25).map { String($0) }
////    var castRoom = (1...8).map { String($0) }
////
////    var roomPicker = UIPickerView()
////    var castPicker = UIPickerView()
////
////    var selectedString = ""
//
//    let nameLabel : UILabel = {
//        let label = UILabel()
//        label.textColor = Color1
//        label.numberOfLines = 10
//        label.lineBreakMode = .byWordWrapping
//        label.sizeToFit()
//        label.font = UIFont.boldSystemFont(ofSize: 13)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
////    let selectRoomTextField : UITextField = {
////        let textField = UITextField()
////         textField.translatesAutoresizingMaskIntoConstraints = false
//////         textField.layer.cornerRadius = 8
//////         textField.layer.borderWidth = 2
////         textField.backgroundColor = Color2
////         textField.layer.borderColor = Color1.cgColor
////         return textField
////    }()
//
////    let castRoomTextField : UITextField = {
////        let textField = UITextField()
////         textField.translatesAutoresizingMaskIntoConstraints = false
//////         textField.layer.cornerRadius = 8
//////         textField.layer.borderWidth = 2
////         textField.backgroundColor = Color2
////         textField.layer.borderColor = Color1.cgColor
////         return textField
////    }()
//
//    let menuImage : UIImageView = {
//        let image = UIImageView(image: #imageLiteral(resourceName: "doted"))
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpLayouts()
//
////        roomPicker.delegate = self
////        roomPicker.dataSource = self
////        selectRoomTextField.delegate = self
////        selectRoomTextField.inputView = roomPicker
////
////        castPicker.delegate = self
////        castPicker.dataSource = self
////        castRoomTextField.delegate = self
////        castRoomTextField.inputView = castPicker
//
//
//        // toolbar
////        let toolbar = UIToolbar()
////        toolbar.sizeToFit()
////        // bar button
////        let barbtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressPicker))
////        toolbar.setItems([barbtn], animated: true)
////        selectRoomTextField.inputAccessoryView = toolbar
////        castRoomTextField.inputAccessoryView = toolbar
//
//    }
////        @objc func donePressPicker() {
////            if selectRoomTextField.isFirstResponder {
////            roomPicker.delegate?.pickerView?(roomPicker, didSelectRow: roomPicker.selectedRow(inComponent: 0), inComponent: 0)
////            selectRoomTextField.text = roomPicker.delegate?.pickerView?(roomPicker, titleForRow: roomPicker.selectedRow(inComponent: 0), forComponent: 0)
////            }
////
////            if castRoomTextField.isFirstResponder {
////                castPicker.delegate?.pickerView?(castPicker, didSelectRow: castPicker.selectedRow(inComponent: 0), inComponent: 0)
////                castRoomTextField.text = castPicker.delegate?.pickerView?(castPicker, titleForRow: castPicker.selectedRow(inComponent: 0), forComponent: 0)
////
////            }
////
////            self.contentView.endEditing(true)
////
////        }
//
//
//    private func setUpLayouts() {
//        contentView.addSubview(nameLabel)
////        contentView.addSubview(selectRoomTextField)
//        contentView.addSubview(menuImage)
//
//
//
//        nameLabel.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
//
////        selectRoomTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
////        selectRoomTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
////        selectRoomTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
//
////        let stackView = UIStackView()
////        contentView.addSubview(stackView)
////        stackView.translatesAutoresizingMaskIntoConstraints = false
////        stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
////        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
////        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
////        stackView.addArrangedSubview(selectRoomTextField)
////        stackView.addArrangedSubview(castRoomTextField)
//
//        menuImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        menuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
////extension WaitingListCell: UIPickerViewDelegate, UIPickerViewDataSource {
////    func numberOfComponents(in pickerView: UIPickerView) -> Int {
////        return 1
////    }
////
////    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
////        if pickerView == self.roomPicker
////               {
////                   return roomNumber.count
////               }
////        if pickerView == self.castPicker
////               {
////                   return castRoom.count
////               }
////               else
////               {
////                   return 0
////               }
////    }
////
////    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        if pickerView == self.roomPicker
////               {
////                   return "Room # \(roomNumber[row])"
////               }
////        if pickerView == self.castPicker
////               {
////                   return "Cast Room # \(castRoom[row])"
////               }
////               else {
////                   return "No Picker Selected"
////               }
////    }
////    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
////        if pickerView == self.roomPicker
////               {
////
////            selectRoomTextField.text = "Room # \(roomNumber[row])"
////
////               }
////        if pickerView == self.castPicker
////               {
////
////            castRoomTextField.text = "Cast Room # \(castRoom[row])"
////
////               }
////
////    }
////}
////
//
