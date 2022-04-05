//
//  XRayWaitingListCell.swift
//  DiagnosisNurse
//
//  Created by YamTech on 30/03/2022.
//

import Foundation
import UIKit

class XRayWaitingListCell : UICollectionViewCell {
    
   
    let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayouts()
        
    }
    private func setUpLayouts() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)

        
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
//        nameLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -5).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
