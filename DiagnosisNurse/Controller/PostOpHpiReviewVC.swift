//
//  PostOpHpiReviewVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 28/03/2022.
//

import UIKit

class PostOpHpiReviewVC: UIViewController {
    
    
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
    
    
    var postOpReview = [reviewStruct]()

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
        
        
        postOp_post_obj_ID = waitingListCommbineArray[hpi_review_array_index_path].postOp!._id!
        print(postOp_post_obj_ID)
        
        postOp_post_problemID = waitingListCommbineArray[hpi_review_array_index_path].postOp!.problemId!
        
       
        
        fillArray()
        
    }
    
    
    
    
    func fillArray(){
        
        var operationArray = [String]()
       
        var surgicalHistoryItems = [String]()
        surgicalHistoryItems.removeAll()
        for v in waitingListCommbineArray[hpi_review_array_index_path].postOp!.surgicalHistory! {
            surgicalHistoryItems.append("\(v.name!) \(v.code!)")
        }
    
//                cell.typeLabel.text = "Visit Type: Post Operation -"
        if waitingListCommbineArray[hpi_review_array_index_path].postOp?.fullBodyCoordinates?.count ?? 0 > 0 {
            
            operationArray.append("\(surgicalHistoryItems.joined(separator: ", ")) \(waitingListCommbineArray[hpi_review_array_index_path].postOp!.fullBodyCoordinates!.joined(separator: ", "))")
            
        }
        
        if operationArray.count > 0 {
            self.postOpReview.append(reviewStruct(n: "Post Operation:", v: operationArray))
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
    
    @objc func nextBtnAction(){
        self.navigationController?.pushViewController(SelectRoomVC(), animated: true)
    }
    @objc func backBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
//---additional functionality
extension PostOpHpiReviewVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return postOpReview.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postOpReview[section].values.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PatientHpiReviewCell
        cell.nameLabel.text = postOpReview[indexPath.section].values[indexPath.item]
        cell.backgroundColor = Color1
        cell.layer.borderColor = Color2.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 15
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: collectionView.frame.size.width, height: 120)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 45)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! PatientHpiReviewCellHeaderView
        headerView.titleLabel.text = postOpReview[indexPath.section].name
        return headerView
    }
    
}
