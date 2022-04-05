//
//  NurseInfoModel.swift
//  DiagnosisNurse
//
//  Created by YamTech on 24/03/2022.
//

import Foundation
import UIKit

struct DoctorInfoModel : Decodable {
    
    let data : DoctorInfoModelData?
}
struct DoctorInfoModelData : Decodable {
    let _id : String?
    let name: String?
    let email: String?
    let phone : Int?
    let emergencyContact: Int?
    let password : String?
    let homeAddress : String?
    let npi : String?
    let dea : String?
    let doctorId : String?
    let companyName : String?
    
}
