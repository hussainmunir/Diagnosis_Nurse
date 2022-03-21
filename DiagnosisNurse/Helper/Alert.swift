//
//  Alert.swift
//  DiagnosisNurse
//
//  Created by YamTech on 21/03/2022.
//

import Foundation
import UIKit

 func alertFunc(vc: UIViewController,message: String){
    
    let alertControl = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
     let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertControl.addAction(alertAction)
    vc.present(alertControl, animated: true, completion: nil)
}
