//
//  VitalsVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import UIKit

class VitalsVC: UIViewController,UITextFieldDelegate {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var cardiovascularType = String()
    var pulmonaryType = String()
    
    var bmi = Float()
    
    var weight = (0...600).map { String($0) }
    var heartRate = (0...400).map { String($0) }
    
    var bp1 = (0...300).map { String($0) }
    var bp2 = (0...200).map { String($0) }
    var temperature = (95...105).map { String($0) }
    var temperature2 = (0...9).map { String($0) }

    
    let numberOfComponents = 2

    
    static var heightMetricImperial = {
        return (12...120).map {
            ("\($0 / 12)' \($0 % 12)\"")
        }
    }()
    
    var heightMetricImperial = [String]()
    var respiratoryRate = (0...200).map { String($0) }
    var height = (12...120).map { String($0) }

    var bmiWeight = Float()
  //  var height = 12...120
    var bmiHeight = Float()

    
    var weightPicker = UIPickerView()
    var heightPicker = UIPickerView()
    var heartRatePicker = UIPickerView()
    var bpPicker = UIPickerView()
    var respiratoryRatePicker = UIPickerView()
    var temperaturePicker = UIPickerView()

    
    let temperatureLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temperature"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let temperatureTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    
    
    let heightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let heightTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let weightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    lazy var weightTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        textF.addTarget(self, action: #selector(weightFunction), for: .touchUpInside)
        return textF
    }()
    let bloodPressureLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blood Pressure"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let bloodPressureTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let heartRateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Heart Rate"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let heartRateTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    let bmiLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BMI"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }()
    
    let calcLabel : UILabelPadding = {
        let label = UILabelPadding()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.font = UIFont.systemFont(ofSize: 18)
        label.layer.borderColor = Color1.cgColor
        label.textColor = Color1
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 2
        
        return label
    }()
    
    let respiratoryRateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Respiratory Rate"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }( )
    let respiratoryRateTextField : UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.borderColor = Color1.cgColor
        textF.textColor = Color1
        textF.layer.cornerRadius = 8
        textF.layer.borderWidth = 2
        textF.setLeftPaddingPoints(10)
        return textF
    }()
    
    let cardiovascularLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cardiovascular"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }()
    
    var regularRateCheck = false
    lazy var regularRateBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Regular rate and rhythm", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(regularRateAction), for: .touchUpInside)
        return button
    }()
    
    var irregularRateCheck = false
    lazy var irregularRateBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Irregular rate and rhythm", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(irregularRateAction), for: .touchUpInside)
        return button
    }()
    
    var murmurCheck = false
    lazy var murmurBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Murmur", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(murmurAction), for: .touchUpInside)
        return button
    }()
    
    var gallopCheck = false
    lazy var gallopBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Gallop", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(gallopAction), for: .touchUpInside)
        return button
    }()
    
    var rubCheck = false
    lazy var rubBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Rub", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(rubAction), for: .touchUpInside)
        return button
    }()

    let pulmonaryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pulmonary"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color1
        return label
    }()
    
    var wheezesCheck = false
    lazy var wheezesBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Wheezes", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(wheezesAction), for: .touchUpInside)
        return button
    }()
    
    var cracklesCheck = false
    lazy var cracklesBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Crackles", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(cracklesAction), for: .touchUpInside)
        return button
    }()
    
    var ctabCheck = false
    lazy var ctabBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CTAB", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderColor = Color1.cgColor
        button.setTitleColor(Color1, for: .normal)
        button.backgroundColor = Color2
        button.addTarget(self, action: #selector(ctabAction), for: .touchUpInside)
        return button
    }()
    
    
  
    lazy var nextBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color2
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 15
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        return button
    }()
    lazy var backBtn : UIButton = {
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
        self.navigationItem.title = "Vitals"
        heightTextField.delegate = self
        weightTextField.delegate = self
        bloodPressureTextField.delegate = self
        heartRateTextField.delegate = self
        temperatureTextField.delegate = self
        respiratoryRateTextField.delegate = self
        setUpLayout()
        
 //       calcBMI()
        
        weightTextField.inputView = weightPicker
        heightTextField.inputView = heightPicker
        heartRateTextField.inputView = heartRatePicker
        bloodPressureTextField.inputView = bpPicker
        respiratoryRateTextField.inputView = respiratoryRatePicker
        temperatureTextField.inputView = temperaturePicker
        

        
        weightPicker.delegate = self
        heightPicker.delegate = self
        heartRatePicker.delegate = self
        weightPicker.dataSource = self
        heightPicker.dataSource = self
        heartRatePicker.dataSource = self
        respiratoryRatePicker.delegate = self
        respiratoryRatePicker.dataSource = self
        bpPicker.delegate = self
        bpPicker.dataSource = self
        temperaturePicker.delegate = self
        temperaturePicker.dataSource = self
        
        weightPicker.tag = 1
        heightPicker.tag = 2
        heartRatePicker.tag = 3
        respiratoryRatePicker.tag = 4
        bpPicker.tag = 5
        temperaturePicker.tag = 6

//        addDoneButtonOnKeyboard()
//        heightMetricImperial = {
//            return (height).map {
//                ("\($0 / 12)' \($0 % 12)\"")
//            }
//        }()
        heightPicker.selectRow(54, inComponent: 0, animated: true)
        weightPicker.selectRow(130, inComponent: 0, animated: true)
        respiratoryRatePicker.selectRow(14, inComponent: 0, animated: true)
        heartRatePicker.selectRow(70, inComponent: 0, animated: true)
        bpPicker.selectRow(120, inComponent: 0, animated: true)
        bpPicker.selectRow(80, inComponent: 1, animated: true)
        temperaturePicker.selectRow(3, inComponent: 0, animated: true)
        temperaturePicker.selectRow(6, inComponent: 1, animated: true)


               
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        // toolbar Weight
        let toolbarWeight = UIToolbar()
        toolbarWeight.sizeToFit()
        // bar button
        let barbtnWeight = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressWeight))
        toolbarWeight.setItems([flexSpace, barbtnWeight], animated: true)
        weightTextField.inputAccessoryView = toolbarWeight
        
        
        let toolbarTemperature = UIToolbar()
        toolbarTemperature.sizeToFit()
        // bar button
        let barbtnTemperature = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressTemperature))
        toolbarTemperature.setItems([flexSpace, barbtnTemperature], animated: true)
        temperatureTextField.inputAccessoryView = toolbarTemperature
        
        // toolbar Height
        let toolbarHeight = UIToolbar()
        toolbarHeight.sizeToFit()
        // bar button
        let barbtnHeight = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressHeight))
        toolbarHeight.setItems([flexSpace, barbtnHeight], animated: true)
        heightTextField.inputAccessoryView = toolbarHeight
        
        // toolbar HeartRate
        let toolbarHeartRate = UIToolbar()
        toolbarHeartRate.sizeToFit()
        // bar button
        let barbtnHeartRate = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressHeartRate))
        toolbarHeartRate.setItems([flexSpace, barbtnHeartRate], animated: true)
        heartRateTextField.inputAccessoryView = toolbarHeartRate
        
        // toolbar RespiratoryRate
        let toolbarRespiratoryRate = UIToolbar()
        toolbarRespiratoryRate.sizeToFit()
        // bar button
        let barbtnRespiratoryRate = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressRespiratoryRate))
        toolbarRespiratoryRate.setItems([flexSpace, barbtnRespiratoryRate], animated: true)
        respiratoryRateTextField.inputAccessoryView = toolbarRespiratoryRate
        
        // toolbar bloodPressure
        let toolbarBP = UIToolbar()
        toolbarBP.sizeToFit()
        // bar button
        let barbtnBP = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressBP))
        toolbarBP.setItems([flexSpace, barbtnBP], animated: true)
        bloodPressureTextField.inputAccessoryView = toolbarBP
        
               //Looks for single or multiple taps.
               let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
               // Do any additional setup after loading the view.
               view.addGestureRecognizer(tap)
           
           }
    
    @objc func donePressWeight(){
       
        weightPicker.delegate?.pickerView?(weightPicker, didSelectRow: weightPicker.selectedRow(inComponent: 0), inComponent: 0)
        weightTextField.text = weightPicker.delegate?.pickerView?(weightPicker, titleForRow: weightPicker.selectedRow(inComponent: 0), forComponent: 0)
   //     bmiWeight = Float(weightTextField.text)
    
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
 //       calcBMI()

     }
    
    @objc func donePressTemperature(){
        
        temperaturePicker.delegate?.pickerView?(temperaturePicker, didSelectRow: temperaturePicker.selectedRow(inComponent: 0), inComponent: 0)
//        temperatureTextField.text = temperaturePicker.delegate?.pickerView?(temperaturePicker, titleForRow: temperaturePicker.selectedRow(inComponent: 0), forComponent: 0)
        
        let temperature1Index = temperaturePicker.selectedRow(inComponent: 0)
        let temperature2Index = temperaturePicker.selectedRow(inComponent: 1)
        bloodPressureTextField.text = "\(temperature[temperature1Index]).\(temperature2[temperature2Index])°F"
        
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func donePressHeight(){

        heightPicker.delegate?.pickerView?(heightPicker, didSelectRow: heightPicker.selectedRow(inComponent: 0), inComponent: 0)

        heightTextField.text = heightPicker.delegate?.pickerView?(heightPicker, titleForRow: heightPicker.selectedRow(inComponent: 0), forComponent: 0)
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

     }
    
    @objc func donePressHeartRate() {
       
  
        heartRateTextField.text = heartRatePicker.delegate?.pickerView?(heartRatePicker, titleForRow: heartRatePicker.selectedRow(inComponent: 0), forComponent: 0)
      
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

     }
    
    @objc func donePressRespiratoryRate(){
       
        respiratoryRateTextField.text = respiratoryRatePicker.delegate?.pickerView?(respiratoryRatePicker, titleForRow: respiratoryRatePicker.selectedRow(inComponent: 0), forComponent: 0)
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

     }
    
    @objc func donePressBP(){
        let bp1Index = bpPicker.selectedRow(inComponent: 0)
        let bp2Index = bpPicker.selectedRow(inComponent: 1)
        bloodPressureTextField.text = "\(bp1[bp1Index]) / \(bp2[bp2Index])"
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

    }

           
           @objc func dismissKeyboard() {
               NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)

               //Causes the view (or one of its embedded text fields) to resign the first responder status.
               view.endEditing(true)
           }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == respiratoryRateTextField || textField == bloodPressureTextField || textField == heartRateTextField {
            
            adjustKeyboard()
        }
           
       
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
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.backgroundColor = Color1
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 1100).isActive = true
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
        
        let blueView = UIView( )
        contentView.addSubview(blueView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = Color2
        blueView.layer.cornerRadius = 20
        blueView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        blueView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        blueView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
       
        //--------temperature--------

        blueView.addSubview(temperatureLabel)
        temperatureLabel.topAnchor.constraint(equalTo: blueView.topAnchor,constant: 20).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(temperatureTextField)
        temperatureTextField.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant:10).isActive = true
        temperatureTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        temperatureTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        temperatureTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //--------height--------
        blueView.addSubview(heightLabel)
        heightLabel.topAnchor.constraint(equalTo: temperatureTextField.bottomAnchor,constant: 20).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        heightLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        heightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(heightTextField)
        heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant:10).isActive = true
        heightTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        heightTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        heightTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //--------weight--------
        blueView.addSubview(weightLabel)
        weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor,constant: 20).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        weightLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(weightTextField)
        weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant:10).isActive = true
        weightTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        weightTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        weightTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //        --------bmi-------
        blueView.addSubview(bmiLabel)
        bmiLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor,constant: 20).isActive = true
        bmiLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bmiLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bmiLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(calcLabel)
        calcLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant:10).isActive = true
        calcLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        calcLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        calcLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //--------blood pressure--------
        blueView.addSubview(bloodPressureLabel)
        bloodPressureLabel.topAnchor.constraint(equalTo: calcLabel.bottomAnchor,constant: 20).isActive = true
        bloodPressureLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bloodPressureLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bloodPressureLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(bloodPressureTextField)
        bloodPressureTextField.topAnchor.constraint(equalTo: bloodPressureLabel.bottomAnchor, constant:10).isActive = true
        bloodPressureTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bloodPressureTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bloodPressureTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //--------heart rate--------
        blueView.addSubview(heartRateLabel)
        heartRateLabel.topAnchor.constraint(equalTo: bloodPressureTextField.bottomAnchor,constant: 20).isActive = true
        heartRateLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        heartRateLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        heartRateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(heartRateTextField)
        heartRateTextField.topAnchor.constraint(equalTo: heartRateLabel.bottomAnchor, constant:10).isActive = true
        heartRateTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        heartRateTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        heartRateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
   
        
        blueView.addSubview(respiratoryRateLabel)
        respiratoryRateLabel.topAnchor.constraint(equalTo: heartRateTextField.bottomAnchor,constant: 20).isActive = true
        respiratoryRateLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        respiratoryRateLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        respiratoryRateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(respiratoryRateTextField)
        respiratoryRateTextField.topAnchor.constraint(equalTo: respiratoryRateLabel.bottomAnchor, constant:10).isActive = true
        respiratoryRateTextField.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        respiratoryRateTextField.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        respiratoryRateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        blueView.addSubview(cardiovascularLabel)
        cardiovascularLabel.topAnchor.constraint(equalTo: respiratoryRateTextField.bottomAnchor,constant: 20).isActive = true
        cardiovascularLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardiovascularLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        cardiovascularLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let stackView1 = UIStackView()
        blueView.addSubview(stackView1)
        stackView1.distribution = .fillEqually
        stackView1.spacing = 10
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.topAnchor.constraint(equalTo: cardiovascularLabel.bottomAnchor, constant: 10).isActive = true
        stackView1.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView1.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView1.addArrangedSubview(regularRateBtn)
        stackView1.addArrangedSubview(irregularRateBtn)
        
        let stackView2 = UIStackView()
        blueView.addSubview(stackView2)
        stackView2.distribution = .fillEqually
        stackView2.spacing = 10
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 10).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView2.addArrangedSubview(murmurBtn)
        stackView2.addArrangedSubview(gallopBtn)
        stackView2.addArrangedSubview(rubBtn)
        
        blueView.addSubview(pulmonaryLabel)
        pulmonaryLabel.topAnchor.constraint(equalTo: stackView2.bottomAnchor,constant: 20).isActive = true
        pulmonaryLabel.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        pulmonaryLabel.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        pulmonaryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let stackView3 = UIStackView()
        blueView.addSubview(stackView3)
        stackView3.distribution = .fillEqually
        stackView3.spacing = 10
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.topAnchor.constraint(equalTo: pulmonaryLabel.bottomAnchor, constant: 10).isActive = true
        stackView3.leadingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView3.trailingAnchor.constraint(equalTo: blueView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView3.addArrangedSubview(ctabBtn)
        stackView3.addArrangedSubview(cracklesBtn)
        stackView3.addArrangedSubview(wheezesBtn)

    }
    
    @objc func regularRateAction(){
        if regularRateCheck == false {
            regularRateBtn.backgroundColor = Color1
            regularRateBtn.setTitleColor(Color2, for: .normal)
            regularRateCheck = true
            irregularRateBtn.backgroundColor = Color2
            irregularRateBtn.setTitleColor(Color1, for: .normal)
            irregularRateCheck = false
            murmurBtn.backgroundColor = Color2
            murmurBtn.setTitleColor(Color1, for: .normal)
            murmurCheck = false
            gallopBtn.backgroundColor = Color2
            gallopBtn.setTitleColor(Color1, for: .normal)
            gallopCheck = false
            rubBtn.backgroundColor = Color2
            rubBtn.setTitleColor(Color1, for: .normal)
            rubCheck = false
            
        }else{
            regularRateBtn.backgroundColor = Color2
            regularRateBtn.setTitleColor(Color1, for: .normal)
            regularRateCheck = false
        }
    }
    
    @objc func irregularRateAction(){
        if irregularRateCheck == false {
            irregularRateBtn.backgroundColor = Color1
            irregularRateBtn.setTitleColor(Color2, for: .normal)
            irregularRateCheck = true
            regularRateBtn.backgroundColor = Color2
            regularRateBtn.setTitleColor(Color1, for: .normal)
            regularRateCheck = false
            murmurBtn.backgroundColor = Color2
            murmurBtn.setTitleColor(Color1, for: .normal)
            murmurCheck = false
            gallopBtn.backgroundColor = Color2
            gallopBtn.setTitleColor(Color1, for: .normal)
            gallopCheck = false
            rubBtn.backgroundColor = Color2
            rubBtn.setTitleColor(Color1, for: .normal)
            rubCheck = false
            
        }else{
            irregularRateBtn.backgroundColor = Color2
            irregularRateBtn.setTitleColor(Color1, for: .normal)
            irregularRateCheck = false
        }
    }
    
    @objc func murmurAction(){
        if murmurCheck == false {
            murmurBtn.backgroundColor = Color1
            murmurBtn.setTitleColor(Color2, for: .normal)
            murmurCheck = true
            regularRateBtn.backgroundColor = Color2
            regularRateBtn.setTitleColor(Color1, for: .normal)
            regularRateCheck = false
            irregularRateBtn.backgroundColor = Color2
            irregularRateBtn.setTitleColor(Color1, for: .normal)
            irregularRateCheck = false
            gallopBtn.backgroundColor = Color2
            gallopBtn.setTitleColor(Color1, for: .normal)
            gallopCheck = false
            rubBtn.backgroundColor = Color2
            rubBtn.setTitleColor(Color1, for: .normal)
            rubCheck = false
            
        }else{
            murmurBtn.backgroundColor = Color2
            murmurBtn.setTitleColor(Color1, for: .normal)
            murmurCheck = false
        }
    }
    
    @objc func gallopAction(){
        
        if gallopCheck == false {
            gallopBtn.backgroundColor = Color1
            gallopBtn.setTitleColor(Color2, for: .normal)
            gallopCheck = true
            regularRateBtn.backgroundColor = Color2
            regularRateBtn.setTitleColor(Color1, for: .normal)
            regularRateCheck = false
            irregularRateBtn.backgroundColor = Color2
            irregularRateBtn.setTitleColor(Color1, for: .normal)
            irregularRateCheck = false
            murmurBtn.backgroundColor = Color2
            murmurBtn.setTitleColor(Color1, for: .normal)
            murmurCheck = false
            rubBtn.backgroundColor = Color2
            rubBtn.setTitleColor(Color1, for: .normal)
            rubCheck = false
            
        }else{
            gallopBtn.backgroundColor = Color2
            gallopBtn.setTitleColor(Color1, for: .normal)
            gallopCheck = false
        }
    }
    
    @objc func rubAction(){
        if rubCheck == false {
            rubBtn.backgroundColor = Color1
            rubBtn.setTitleColor(Color2, for: .normal)
            rubCheck = true
            regularRateBtn.backgroundColor = Color2
            regularRateBtn.setTitleColor(Color1, for: .normal)
            regularRateCheck = false
            irregularRateBtn.backgroundColor = Color2
            irregularRateBtn.setTitleColor(Color1, for: .normal)
            irregularRateCheck = false
            murmurBtn.backgroundColor = Color2
            murmurBtn.setTitleColor(Color1, for: .normal)
            murmurCheck = false
            gallopBtn.backgroundColor = Color2
            gallopBtn.setTitleColor(Color1, for: .normal)
            gallopCheck = false
            
        }else{
            rubBtn.backgroundColor = Color2
            rubBtn.setTitleColor(Color1, for: .normal)
            rubCheck = false
        }
    }
    
    @objc func ctabAction(){
        if ctabCheck == false {
            ctabBtn.backgroundColor = Color1
            ctabBtn.setTitleColor(Color2, for: .normal)
            ctabCheck = true
            cracklesBtn.backgroundColor = Color2
            cracklesBtn.setTitleColor(Color1, for: .normal)
            cracklesCheck = false
            wheezesBtn.backgroundColor = Color2
            wheezesBtn.setTitleColor(Color1, for: .normal)
            wheezesCheck = false
            
        }else{
            ctabBtn.backgroundColor = Color2
            ctabBtn.setTitleColor(Color1, for: .normal)
            ctabCheck = false
        }
        
    }
    
    
    @objc func cracklesAction(){
        
        if cracklesCheck == false {
            cracklesBtn.backgroundColor = Color1
            cracklesBtn.setTitleColor(Color2, for: .normal)
            cracklesCheck = true
            ctabBtn.backgroundColor = Color2
            ctabBtn.setTitleColor(Color1, for: .normal)
            ctabCheck = false
            wheezesBtn.backgroundColor = Color2
            wheezesBtn.setTitleColor(Color1, for: .normal)
            wheezesCheck = false
            
        }else{
            cracklesBtn.backgroundColor = Color2
            cracklesBtn.setTitleColor(Color1, for: .normal)
            cracklesCheck = false
        }
    }
    
    @objc func wheezesAction(){
        if wheezesCheck == false {
            wheezesBtn.backgroundColor = Color1
            wheezesBtn.setTitleColor(Color2, for: .normal)
            wheezesCheck = true
            ctabBtn.backgroundColor = Color2
            ctabBtn.setTitleColor(Color1, for: .normal)
            ctabCheck = false
            cracklesBtn.backgroundColor = Color2
            cracklesBtn.setTitleColor(Color1, for: .normal)
            cracklesCheck = false
            
        }else{
            wheezesBtn.backgroundColor = Color2
            wheezesBtn.setTitleColor(Color1, for: .normal)
            wheezesCheck = false
        }
    }
    
    @objc func weightFunction() {
        weightTextField.text = "130 lbs"
    }
    
    
    @objc func backBtnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func nextBtnAction() {
        
        if regularRateCheck {
            cardiovascularType = "Regular rate and rhythm"
        }
        else if irregularRateCheck {
            cardiovascularType = "Irregular rate and rhythm"
        }
        else if murmurCheck {
            cardiovascularType = "Murmur"
            
        }
        else if gallopCheck {
            cardiovascularType = "Gallop"
            
        }
        else if rubCheck {
            cardiovascularType = "Rub"
            
        }
        
        if ctabCheck {
            pulmonaryType = "CTAB"
        }
        else if cracklesCheck {
            pulmonaryType = "Crackles"
        }
        else if wheezesCheck {
            pulmonaryType = "Wheezes"
            
        }
        
        
        vitalsDic_nurse = [
            "temperature": temperatureTextField.text ?? "",
        "height" : heightTextField.text ?? "",
        "weight" : weightTextField.text ?? "",
        "BP" : bloodPressureTextField.text ?? "",
        "heartrate" : heartRateTextField.text ?? "",
        "BMI" : calcLabel.text ?? "",
        "respiratory" : respiratoryRateTextField.text ?? "",
        "cardiovascular": cardiovascularType,
        "pulmonary": pulmonaryType
    ]
        self.navigationController?.pushViewController(DiagnosticStudiesVC(), animated: true)
    }
 
}

extension VitalsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == bpPicker || pickerView == temperaturePicker {
            return numberOfComponents
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return weight.count
        case 2:
            return VitalsVC.heightMetricImperial.count
        case 3:
            return heartRate.count
        case 4:
            return respiratoryRate.count
        case 5:
            if component == 0 {
                return bp1.count
            }else if component == 1 {
                return bp2.count
            }else { return 1 }
        case 6:
//            return temperature.count
            if component == 0 {
                return temperature.count
            }else if component == 1 {
                return temperature2.count
            }else { return 1 }
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
           return "\(weight[row]) lbs"

        case 2:
            return VitalsVC.heightMetricImperial[row]
//            return "\(height[row]) inches"
        case 3:
            return heartRate[row]
        case 4:
            return respiratoryRate[row]
        case 5:
            if component == 0 {
                return (bp1[row])
            }else if component == 1 {
                return (bp2[row])
            } else {
                return ""
            }
        case 6:
//            return "\(temperature[row])°F"
            
            if component == 0 {
                return "\(temperature[row])"
            }else if component == 1 {
                return "\(temperature2[row])"
            } else {
                return ""
            }
        default:
            return "error"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            weightTextField.text = "\(weight[row]) lbs"
            bmiWeight = Float(weight[row])!
            print(bmiWeight)
            calcBMI()

        case 2:
            
          //  heightTextField.text = "\(height[row]) inches"
            heightTextField.text = VitalsVC.heightMetricImperial[row]

            bmiHeight = Float(height[row])!
            print(bmiHeight)
        case 3:
            heartRateTextField.text = heartRate[row]
        case 4:
            respiratoryRateTextField.text = respiratoryRate[row]
        case 5:
            let bp1Index = bpPicker.selectedRow(inComponent: 0)
            let bp2Index = bpPicker.selectedRow(inComponent: 1)
            bloodPressureTextField.text = "\(bp1[bp1Index]) / \(bp2[bp2Index])"
        case 6:
            let temperature1Index = temperaturePicker.selectedRow(inComponent: 0)
            let temperature2Index = temperaturePicker.selectedRow(inComponent: 1)
            temperatureTextField.text = "\(temperature[temperature1Index]).\(temperature2[temperature2Index])°F"
//            temperatureTextField.text = "\(temperature[row])°F"
        default:
                return
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return CGFloat(100.0)
    }
}
extension VitalsVC {
    
    func calcBMI() {
        bmi = 703 * (bmiWeight / (bmiHeight * bmiHeight))
        let bmiString = String(bmi)
//        bmiBtn.setTitle("\(bmiString)", for: .normal)
//        bmiBtn.setTitleColor(UIColor.black, for: .normal)

        calcLabel.text = bmiString
        print(bmi)
    }
    
}

class UILabelPadding: UILabel {

    let padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }



}

