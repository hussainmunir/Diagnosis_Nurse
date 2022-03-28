//
//  FollowUpHpiReviewVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 28/03/2022.
//

import UIKit

class FollowUpHpiReviewVC: UIViewController {
    
    
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
    
    
    var followUpReview = [reviewStruct]()
    
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
        
        
        followUp_post_obj_ID = waitingListCommbineArray[hpi_review_array_index_path].followUp!._id!
        print(followUp_post_obj_ID)
        
        followUp_post_problemID = waitingListCommbineArray[hpi_review_array_index_path].followUp!.problemId!
        
       
        
        fillArray()
        
    }
    
    
    
    
    func fillArray(){
        
        var symptomsArray = [String]()
        var painScaleArray = [String]()
        var treatmentPlanArray = [String]()
        var injectionHelpArray = [String]()
        var injectionDetailArray = [String]()
        var traumaArray = [String]()
        var traumaDetailArray = [String]()
        var differentialDiagnosisArray = [String]()
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.differentialDignosis?.count ?? 0 > 0 {
            for v in waitingListCommbineArray[hpi_review_array_index_path].followUp!.patientInWaitingRoom!.differentialDignosis! {
                differentialDiagnosisArray.append(v.desc ?? "")
            }

        }
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.symptoms?.count ?? 0 > 0 {
            symptomsArray.append(waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.symptoms ?? "")
        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.painScale?.count ?? 0 > 0 {
            painScaleArray.append(waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.painScale ?? "")
        }
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.treatmentPlanFollow?.count ?? 0 > 0 {
            treatmentPlanArray.append("\(waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.treatmentPlanFollow?.joined(separator: ", ") ?? "")")
        }
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.didInjectionHelp == "yes" {
            injectionHelpArray.append("Yes")
        }
        else if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.didInjectionHelp == "no" {
            injectionHelpArray.append("No")

        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.injectionHelpDetail?.count ?? 0 > 0 {
            injectionDetailArray.append(waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.injectionHelpDetail ?? "")
        }
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.fallsOrTrauma == true {
            traumaArray.append("Yes")
        }
        
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.fallsTraumaDetail?.count ?? 0 > 0 {
            traumaDetailArray.append(waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.fallsTraumaDetail ?? "")
        }
        
        
        
        
        
//        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.differentialDignosis?.count ?? 0 > 0 {
//            self.followUpReview.append(reviewStruct(n: "Diagnosis:", v: waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.differentialDignosis.desc ?? ""))
//        }
        
//        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.differentialDignosis?.count  ?? 0 > 0 {
//            self.followUpReview.append(reviewStruct(n: "Diagnosis:", v: waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.differentialDignosis[0].desc! ))
//                   }
           
        if differentialDiagnosisArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Diagnosis:", v: differentialDiagnosisArray))
        }
        if symptomsArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Symptom(s):", v: symptomsArray))
        }
        if painScaleArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Pain Scale:", v: painScaleArray))
        }
        if treatmentPlanArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Treatment Plan:", v: treatmentPlanArray))
        }
        if injectionHelpArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Did Injection help:", v: injectionHelpArray))
        }
        if injectionDetailArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "How long did it help for?", v: injectionDetailArray))
        }
        if traumaArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Any falls or trauma since last being seen?", v: traumaArray))
        }
        if traumaDetailArray.count > 0 {
            self.followUpReview.append(reviewStruct(n: "Details:", v: traumaDetailArray))
        }
        
        if waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.treatmentPlanFollow?.count ?? 0 > 0 {
            self.followUpReview.append(reviewStruct(n: "Was Treatment Plan Followed:", v: waitingListCommbineArray[hpi_review_array_index_path].followUp?.patientInWaitingRoom?.treatmentPlanFollow ?? [""]))
        }
        else{
                self.followUpReview.append(reviewStruct(n: "Was Treatment Plan Followed:", v: ["No"] ))
        }
        
        //        if waitingListArray[hpi_review_array_index_path].symptoms!.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Character of symptom(s):", v: waitingListArray[hpi_review_array_index_path].symptoms!))
        //        }
        //        if waitingListArray[hpi_review_array_index_path].aggravatingFactors!.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Aggravating factors:", v: waitingListArray[hpi_review_array_index_path].aggravatingFactors!))
        //        }
        //        if waitingListArray[hpi_review_array_index_path].alleviatingFactors!.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Alleviating factors:", v: waitingListArray[hpi_review_array_index_path].alleviatingFactors!))
        //        }
        //        if previousTreatmentArray.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Previous treatment for this problem:", v: previousTreatmentArray))
        //        }
        
        //        if waitingListCommbineArray[hpi_review_array_index_path].problem!.symptoms!.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Character of symptom(s):", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.symptoms!))
        //        }
        //
        //        if waitingListCommbineArray[hpi_review_array_index_path].problem!.aggravatingFactors!.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Aggravating factors:", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.aggravatingFactors!))
        //        }
        //        if waitingListCommbineArray[hpi_review_array_index_path].problem!.alleviatingFactors!.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Alleviating factors:", v: waitingListCommbineArray[hpi_review_array_index_path].problem!.alleviatingFactors!))
        //        }
        //        if previousTreatmentArray.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Previous treatment for this problem:", v: previousTreatmentArray))
        //        }
        
        
        //        self.followUpReview.append(reviewStruct(n: "Previous treatment for this problem:", v: (waitingListArray[hpi_review_array_index_path].previousTreatment?.previousTreatmentInclude!)!))
        
        
        //        if medicinesDetailArray.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Current medications for this problem:", v: medicinesDetailArray))
        //        }
        //        if allergiesDetailArray.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Allergies:", v: allergiesDetailArray))
        //        }
        //        else{
        //            self.followUpReview.append(reviewStruct(n: "Allergies:", v: ["NKDA"]))
        //        }
        
        //        if (waitingListArray[hpi_review_array_index_path].symptomsRadiation?.radiateAt!.count)! > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Radiation of symptom(s):", v: (waitingListArray[hpi_review_array_index_path].symptomsRadiation?.radiateAt!)!))
        //        }
        
        //        if (waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsRadiation?.radiateAt!.count)! > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Radiation of symptom(s):", v: (waitingListCommbineArray[hpi_review_array_index_path].problem!.symptomsRadiation?.radiateAt!)!))
        //        }
        //
        //        if radiationDetailArray.count > 0 {
        //        self.followUpReview.append(reviewStruct(n: "Details:", v: radiationDetailArray))
        //        }
        
        
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
    
    @objc func nextBtnAction(){
        self.navigationController?.pushViewController(VitalsVC(), animated: true)
    }
    @objc func backBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
//---additional functionality
extension FollowUpHpiReviewVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return followUpReview.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followUpReview[section].values.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PatientHpiReviewCell
        cell.nameLabel.text = followUpReview[indexPath.section].values[indexPath.item]
        cell.backgroundColor = Color1
        cell.layer.borderColor = Color2.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 15
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sec = followUpReview[indexPath.section].name
        if sec == "Details:" {
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
        headerView.titleLabel.text = followUpReview[indexPath.section].name
        return headerView
    }
    
}
