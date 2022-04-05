//
//  PatientLabCell.swift
//  DiagnosisNurse
//
//  Created by YamTech on 05/04/2022.
//

import Foundation
import UIKit

class PatientLabCell : UICollectionViewCell {
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayouts()
        
    }
    private func setUpLayouts( ){
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(progressLabel)
        
//        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

//        dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
      //  dateLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        progressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        progressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

   }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

