//
//  PatientProfileVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 22/03/2022.
//


import UIKit

class PatientReviewVC: UIViewController {

 
    let nextBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color2
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 15
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextBtnAction), for: .touchUpInside)
        return button
    }( )
    let backBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color2
        button.setTitleColor(Color1, for: .normal)
        button.layer.cornerRadius = 15
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        return button
    }( )
        
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout( )
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Color1
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PatientHpiReviewCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(PatientHpiReviewCellHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        return cv
    }( )
    
    
    var reviewArray = [reviewStruct]()
    
    // MARK: VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color2
        self.navigationItem.standardAppearance = appearance;
        self.navigationItem.scrollEdgeAppearance = self.navigationItem.standardAppearance
        view.backgroundColor = Color1
        self.navigationItem.title = "HPI Review"
        self.tabBarController?.tabBar.isHidden = true
        setupConstraint()
        collectionView.dataSource = self
        collectionView.delegate = self
        fillArray()
       
   }
    
    func getPatientInfo(pid:String){
        
        guard let url = URL(string: "\(K.mainURL)/api/v1/patients/getPatientById/\(pid)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue(getToken, forHTTPHeaderField: "Authorization")
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
    
    
    func fillArray(){
           
        var startDateArray = [String]()
        let severityArray = [String]()
        var durationArray = [String]()
        var injuryArray = [String]()
        var radiationDetailArray = [String]()
        var allergiesDetailArray = [String]()
        var medicinesDetailArray = [String]()
        var previousTreatmentArray = [String]()

//        if waitingListArray[hpi_review_array_index_path].symptomsStarted!.count > 0 {
//        startDateArray.append(waitingListArray[hpi_review_array_index_path].symptomsStarted!)
//        }
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsStarted!.count > 0 {
        startDateArray.append(waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsStarted!)
        }
       
//        let serverityText = "\(waitingListArray[hpi_review_array_index_path].symptomsAtBest!)-\(waitingListArray[hpi_review_array_index_path].symptomsAtWorst!)"
        
//        let serverityText = "\(waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsAtBest!)-\(waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsAtWorst!)"
//
//        if waitingListArray[hpi_review_array_index_path].symptomsDuration!.count > 0 {
//        durationArray.append(waitingListArray[hpi_review_array_index_path].symptomsDuration!)
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsDuration!.count > 0 {
            durationArray.append(waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsDuration!)
        }
        
//        if waitingListArray[hpi_review_array_index_path].injury?.Details != "" {
//
//        injuryArray.append((waitingListArray[hpi_review_array_index_path].injury?.Details) ?? "")
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.injury?.Details != "" {
        
        injuryArray.append((waitingListCommbineArray[hpi_review_array_index_path].problem!.injury?.Details) ?? "")
        }
        
//        if waitingListArray[hpi_review_array_index_path].symptomsRadiation?.radiateDetails != "" {
//        radiationDetailArray.append((waitingListArray[hpi_review_array_index_path].symptomsRadiation?.radiateDetails) ?? "")
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsRadiation?.radiateDetails != "" {
            radiationDetailArray.append((waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsRadiation?.radiateDetails) ?? "")
        }
        
//        if waitingListArray[hpi_review_array_index_path].previousTreatment.physicalTherapy.whenBegin != "" {
//            previousTreatmentArray.append("Physical Therapy, started on: \(waitingListArray[hpi_review_array_index_path].previousTreatment.physicalTherapy.whenBegin ?? ""), number of sessions: \(waitingListArray[hpi_review_array_index_path].previousTreatment.physicalTherapy.numberOfSession ?? "")")
//        }
        
        
//
//        if waitingListArray[hpi_review_array_index_path].previousTreatment!.physicalTherapy.whenBegin != "" {
//            previousTreatmentArray.append("Physical Therapy")
//            previousTreatmentArray.append("started on: \(waitingListArray[hpi_review_array_index_path].previousTreatment!.physicalTherapy.whenBegin ?? "")")
//            previousTreatmentArray.append("number of sessions: \(waitingListArray[hpi_review_array_index_path].previousTreatment!.physicalTherapy.numberOfSession ?? "")")
//        }
       
//        print("when begin  \(waitingListCommbineArray[hpi_review_array_index_path].problem?.previousTreatment?.physicalTherapy?.whenBegin)")
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem?.previousTreatment?.physicalTherapy?.whenBegin != "" &&  waitingListCommbineArray[hpi_review_array_index_path].problem?.previousTreatment?.physicalTherapy?.whenBegin != nil {
            previousTreatmentArray.append("Physical Therapy")
            previousTreatmentArray.append("started on: \(waitingListCommbineArray[hpi_review_array_index_path].problem?.previousTreatment?.physicalTherapy?.whenBegin ?? "")")
            previousTreatmentArray.append("number of sessions: \(waitingListCommbineArray[hpi_review_array_index_path].problem?.previousTreatment?.physicalTherapy?.numberOfSession ?? "")")
        }
     
        
//        if waitingListArray[hpi_review_array_index_path].previousTreatment!.previousTreatmentInclude.count > 0 {
//        previousTreatmentArray.append("\(waitingListArray[hpi_review_array_index_path].previousTreatment!.previousTreatmentInclude.joined(separator: ", "))")
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.previousTreatment!.previousTreatmentInclude!.count > 0 {
        previousTreatmentArray.append("\(waitingListCommbineArray[hpi_review_array_index_path].problem!.previousTreatment!.previousTreatmentInclude!.joined(separator: ", "))")
        }
        
        
        
        if global_patient_allergies.count > 0 {
        for v in global_patient_allergies {
            allergiesDetailArray.append("\(v.name!), Reaction: \(v.reaction!)")
            detailAllergies = allergiesDetailArray
        }
            }
        
//        if waitingListArray[hpi_review_array_index_path].currentMedications!.count > 0 {
//        for v in waitingListArray[hpi_review_array_index_path].currentMedications! {
//            medicinesDetailArray.append("\(v.name ?? "") \(v.dose ?? "") \(v.frequency ?? "") \(v.frequencyasneeded ?? "")" )
////            detailMedicines = medicinesDetailArray
//            }
//
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.currentMedications!.count > 0 {
        for v in waitingListCommbineArray[hpi_review_array_index_path].problem!.currentMedications! {
            medicinesDetailArray.append("\(v.name ?? "") \(v.dose ?? "") \(v.frequency ?? "") \(v.frequencyasneeded ?? "")" )
//            detailMedicines = medicinesDetailArray
            }
            
        }
        
//        if waitingListArray[hpi_review_array_index_path].currentPatientMedication?.count ?? 0 > 0 {
//        detailMedicines.removeAll()
//        for v in waitingListArray[hpi_review_array_index_path].currentPatientMedication! {
//            detailMedicines.append("\(v.name ?? "") \(v.dose ?? "") \(v.frequency ?? "") \(v.frequencyasneeded ?? "")" )
//        }
//            }
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.currentPatientMedication?.count ?? 0 > 0 {
        detailMedicines.removeAll()
        for v in waitingListCommbineArray[hpi_review_array_index_path].problem!.currentPatientMedication! {
            detailMedicines.append("\(v.name ?? "") \(v.dose ?? "") \(v.frequency ?? "") \(v.frequencyasneeded ?? "")" )
        }
            }
        
//        if waitingListArray[hpi_review_array_index_path].fullBodyCoordinates!.count > 0 {
//        self.reviewArray.append(reviewStruct(n: "Chief Complaint?", v: waitingListArray[hpi_review_array_index_path].fullBodyCoordinates!))
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.fullBodyCoordinates!.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Chief Complaint?", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.fullBodyCoordinates!))
        }
        
        
        if startDateArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Onset of symptom(s):", v: startDateArray))
        }
        if severityArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Severity of symptom(s):", v: severityArray))
        }
        if durationArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Duration:", v: durationArray))
        }
        if injuryArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Injury:", v: injuryArray))
        }
        
        
//        if waitingListArray[hpi_review_array_index_path].symptoms!.count > 0 {
//        self.reviewArray.append(reviewStruct(n: "Character of symptom(s):", v: waitingListArray[hpi_review_array_index_path].symptoms!))
//        }
//        if waitingListArray[hpi_review_array_index_path].aggravatingFactors!.count > 0 {
//        self.reviewArray.append(reviewStruct(n: "Aggravating factors:", v: waitingListArray[hpi_review_array_index_path].aggravatingFactors!))
//        }
//        if waitingListArray[hpi_review_array_index_path].alleviatingFactors!.count > 0 {
//        self.reviewArray.append(reviewStruct(n: "Alleviating factors:", v: waitingListArray[hpi_review_array_index_path].alleviatingFactors!))
//        }
//        if previousTreatmentArray.count > 0 {
//        self.reviewArray.append(reviewStruct(n: "Previous treatment for this problem:", v: previousTreatmentArray))
//        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.symptoms!.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Character of symptom(s):", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.symptoms!))
        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.aggravatingFactors!.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Aggravating factors:", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.aggravatingFactors!))
        }
        if waitingListCommbineArray[hpi_review_array_index_path].problem!.alleviatingFactors!.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Alleviating factors:", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.alleviatingFactors!))
        }
        if previousTreatmentArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Previous treatment for this problem:", v: previousTreatmentArray))
        }
        
        
//        self.reviewArray.append(reviewStruct(n: "Previous treatment for this problem:", v: (waitingListArray[hpi_review_array_index_path].previousTreatment?.previousTreatmentInclude!)!))
        
        
        if medicinesDetailArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Current medications for this problem:", v: medicinesDetailArray))
        }
        if allergiesDetailArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Allergies:", v: allergiesDetailArray))
        }
        else{
            self.reviewArray.append(reviewStruct(n: "Allergies:", v: ["NKDA"]))
        }
        
//        if (waitingListArray[hpi_review_array_index_path].symptomsRadiation?.radiateAt!.count)! > 0 {
//        self.reviewArray.append(reviewStruct(n: "Radiation of symptom(s):", v: (waitingListArray[hpi_review_array_index_path].symptomsRadiation?.radiateAt!)!))
//        }
        
        if (waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsRadiation?.radiateAt!.count)! > 0 {
        self.reviewArray.append(reviewStruct(n: "Radiation of symptom(s):", v: (waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsRadiation?.radiateAt!)!))
        }
        
        if radiationDetailArray.count > 0 {
        self.reviewArray.append(reviewStruct(n: "Details:", v: radiationDetailArray))
        }

        
    }
    func setupConstraint(){
        
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
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant:10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 5).isActive = true

    }
    
    @objc func nextBtnAction() {
        self.navigationController?.pushViewController(VitalsVC(), animated: true)
    }
    @objc func backBtnAction() {
        self.navigationController?.popViewController(animated: true)
    }

}
extension PatientReviewVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return reviewArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewArray[section].values.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PatientHpiReviewCell
        cell.nameLabel.text = reviewArray[indexPath.section].values[indexPath.item]
        cell.backgroundColor = Color1
        cell.layer.borderColor = Color2.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 15
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sec = reviewArray[indexPath.section].name
        if sec == "Add Injury?" || sec == "Details:" {
            return CGSize(width: collectionView.frame.size.width, height: 150)
        }else{
            return CGSize(width: collectionView.frame.size.width, height: 45)
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 45)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! PatientHpiReviewCellHeaderView
        headerView.titleLabel.text = reviewArray[indexPath.section].name
        return headerView
    }
    
}
