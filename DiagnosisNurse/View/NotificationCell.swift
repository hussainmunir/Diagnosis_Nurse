

import Foundation
import UIKit

class notificationCell : UITableViewCell {
    let personImage : UIImageView = {
        let image  = UIImageView(image: #imageLiteral(resourceName: "notificationProfile"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    let timeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let messageLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(personImage)
        setUpLayout()
    }
    private func setUpLayout( ){
        personImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        personImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:10).isActive = true
        personImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        personImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0.7).isActive = true
        
        let stackview = UIStackView( )
        contentView.addSubview(stackview)
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 10).isActive = true
        stackview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackview.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        stackview.addArrangedSubview(nameLabel)
        stackview.addArrangedSubview(timeLabel)
        
        contentView.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: stackview.topAnchor,constant:2).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: 7).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



