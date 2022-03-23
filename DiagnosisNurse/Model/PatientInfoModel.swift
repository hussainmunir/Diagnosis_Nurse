//
//  File.swift
//  DiagnosisNurse
//
//  Created by YamTech on 23/03/2022.
//

import Foundation
import UIKit

struct PatientInfoModel: Decodable{
    let data : PatientInfoModelData?
}
struct PatientInfoModelData: Decodable {
//    let pharmacy : [String]?
//    let _id : String?
//    let medicalConditions: [MedicalConditionsDataModel]?
    let allergies: [AllergiesDataModel]?
    let fname : String?
    let mname : String?
    let lname : String?
//    let suffix : String?
//    let gender : String?
//    let password : String?
//    let dateOfBirth : String?
//    let contact : ContactDataModel?
//    let insurance : InsuranceDataModel?
//    let emergencyContact : EmergencyContactDataModel?
//    let surgicalHistory: [PatientSurgicalHistory]?
//    let familyHistory: [FamilyHistoryModelData]?
//    let socialHistory: SocialHistoryModelData?
    let reviewSystem: PatientReviewSystem?
//    let currentMedications: [CurrentMedicationDataModel]?
    
//    let __v : String?
//    let labs : [LabsDataModel]?
}
struct MedicalConditionsDataModel : Decodable {
//    let _id : String?
    let value : String?
    let condition : String?
}
struct AllergiesDataModel : Decodable {
    let name : String?
    let reaction : String?
}
struct ContactDataModel : Decodable {
//    let _id : String?
    let phone : String?
    let address : String?
    let email : String?
    let unit : String?
    let city : String?
    let state : String?
    let zipCode : String?
}
struct InsuranceDataModel : Decodable {
    let frontPhoto : FrontPhotoDataModel?
    let backPhoto : BackPhotoDataModel?
//    let _id : String?
    let groupId : String?
    let membershipId : String?
    let carrier : String?
    
}

struct EmergencyContactDataModel : Decodable {
//    let _id : String?
    let name : String?
    let phoneNumber : String?
    
}

struct FrontPhotoDataModel : Decodable {
    let url : String?
    let public_id : String?
}
struct BackPhotoDataModel : Decodable {
    let url : String?
    let public_id : String?
}
struct PatientReviewSystem : Decodable {
    let endocrine: [String]?
    let general: [String]?
    let hemotologic: [String]?
    let musculoskeletal: [String]?
    let neurologic: [String]?
    let psychiatric: [String]?
    let skin: [String]?
    let _id: String?
    
}
struct PatientSurgicalHistory : Decodable {
//    let _id : String?
    let code : String?
    let name : String?
}

struct FamilyHistoryModelData: Decodable {
    let motherMConditions : [String]?
    let fatherMConditions : [String]?
    let grandparentMConditions : [String]?
    let siblingsMConditions : [String]?
//    let _id : String?
    
}
struct SocialHistoryModelData:Codable {
//    let _id: String?
    var drink: DrinkModel?
    let maritalStatus: String?
    let handDominance: String?
    let occupation: String?
    let smoke: SmokeModel?
}
struct DrinkModel:Codable {
//    let _id : String?
    let howOften : String?
    var isDrink: Bool?
    let perSitting : String?
}
struct SmokeModel:Codable {
//    let _id : String?
    let isSmoke : Bool?
    let numberOfPacks : String?
}

struct CurrentMedicationDataModel: Decodable {
//    let _id: String?
    let name: String?
    let dose: String?
    let frequency: String?
    let frequencyasneeded: String?
    
}
struct LabsDataModel: Decodable {
    
//    let _id : String?
    let patientId : String?
    let doctorId : String?
    let name : String?
    let date : String?
    let description : String?
    let photos : [PhotoDataModel]
    let pdf : [PdfsDataModel]
    
}

struct PhotoDataModel: Decodable {
//    let _id : String?
    let url : String?
    let public_id : String?
}
struct PdfsDataModel: Decodable {
    let url : String?
    let public_id : String?
}
