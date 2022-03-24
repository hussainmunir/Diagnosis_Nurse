//
//  UserAuthModel.swift
//  DiagnosisNurse
//
//  Created by YamTech on 24/03/2022.
//

import Foundation
import UIKit

struct userAuth: Decodable {
    let message : String?
    let token : String?
    let Error : String?
}
