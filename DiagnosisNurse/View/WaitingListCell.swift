//
//  WaitingListCellVC1.swift
//  DiagnosisNurse
//
//  Created by YamTech on 28/03/2022.
//

import Foundation
import UIKit

class WaitingListCell : UICollectionViewCell {
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    let profileImage : UIImageView = {
//        let image = UIImageView(image:#imageLiteral(resourceName: "notificationProfile"))
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        return image
//    }( )
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
    let typeLabel : UILabel = {
        let label = UILabel()
        label.textColor = Color1
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
//        label.frame.size.width = 300
        label.sizeToFit()
        return label
    }()
    let menuImage : UIImageView = {
           let image = UIImageView(image: #imageLiteral(resourceName: "doted"))
           image.translatesAutoresizingMaskIntoConstraints = false
           image.contentMode = .scaleAspectFit
           return image
       }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayouts( )
        
    }
    private func setUpLayouts() {
        contentView.addSubview(timeLabel)
//        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(menuImage)
        
        timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -40).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        
//        profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
//        profileImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        typeLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        menuImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        menuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
