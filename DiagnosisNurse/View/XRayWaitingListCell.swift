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
   
    let menuImage : UIImageView = {
           let image = UIImageView(image: #imageLiteral(resourceName: "doted"))
           image.translatesAutoresizingMaskIntoConstraints = false
           image.contentMode = .scaleAspectFit
           return image
       }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayouts()
        
    }
    private func setUpLayouts() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(menuImage)
        
        
        nameLabel.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        menuImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        menuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
