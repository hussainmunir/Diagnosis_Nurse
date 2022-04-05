//
//  WaitingListAllModel.swift
//  DiagnosisNurse
//
//  Created by YamTech on 23/03/2022.
//

import Foundation
import UIKit

struct WaitingAllModel: Decodable {
//    let success: Bool
    let data: [WaitingAllCombineDataModel]?
}

struct WaitingAllModelTest: Decodable {
//    let success: Bool
    let data: [WaitingAllCombineDataModelTest]?
}

// MARK: - DataClass
struct WaitingAllDataModel : Decodable {
    let problem: [WaitingDataModel]?
    let operation: [OperationModel]?
    let followUpModal: [FollowUpModal]?
}
// MARK: - DataClass
struct WaitingAllCombineDataModel : Decodable {
    let problem: WaitingDataModel?
    let postOp: OperationModel?
    let followUp: FollowUpModal?
    let waitingListType: String?
}

// MARK: - DataClass
struct WaitingAllCombineDataModelTest : Decodable {
    
    let problem: WaitingDataModel?
//    let problem: Problem?
    let postOp: OperationModel?
    let followUp: FollowUpModal?
    let waitingListType: String?
}

// MARK: - Problem
struct Problem : Decodable {
    let _id: String?
    let injury: Injury?
    let symptomsRadiation: SymptomsRadiation?
    let previousTreatment: PreviousTreatment?
    let fullBodyCoordinates, symptoms, aggravatingFactors, alleviatingFactors: [String]?
    let patientID, doctorId, symptomsStarted, symptomsDevelop: String?
    let symptomsDuration, symptomsAtBest, symptomsAtWorst: String?
    let currentMedications: [CurrentMedication]?
    let currentPatientMedication : [PatientMedicationModel]?
    let createdAt: String?
    let isChecked: Bool?
    let patientName: String?
    
    
}
// MARK: - Injury
struct Injury : Decodable {
    let isInjury: Bool?
    let details: String?
}
// MARK: - SymptomsRadiation
struct SymptomsRadiation : Decodable {
    let isRadiate: Bool?
    let radiateAt: [String]?
    let radiateDetails: String?
}
// MARK: - PreviousTreatment
struct PreviousTreatment: Decodable {
    let physicalTherapy: PhysicalTherapy?
    let previousTreatmentInclude: [String]?
    let isPreviousTreatment: Bool?
    let otherTreatments: String?
}

// MARK: - CurrentMedication
struct CurrentMedication: Decodable {
    let _id, frequencyasneeded, name, frequency: String?
    let dose: String?
}

struct PatientMedicationModel:Decodable {
//    let currentMedications : [String]?
//    let newMedications : [String]?
    let name: String?
    let dose: String?
    let frequency: String?
    let frequencyasneeded: String?
}
// MARK: - FollowUpModal
struct FollowUpModal: Decodable {
    let _id: String?
    let patientInWaitingRoom: PatientInWaitingRoom?
//    let followUpVisit: FollowUpVisit?
    let patientId, doctorId, problemId: String?
//    let isChecked: Bool?
    let patientName: String?
    let currentPatientMedication : [PatientMedicationModel]?
    let createdAt : String?
}

// MARK: - FollowUpVisit
struct FollowUpVisit: Decodable {
    let physicalExamThreeDModal, rangeOfMotion, physicalExam: [String]?
    let strength: [Strength]?
    let specialTests: [SpecialTest]?
    let reflexes: [Reflexes]?
    let diagnosticStudies: [DignosisDiagnosticStudy]?
    let treatmentPlan: [TreatmentPlan]?
}

// MARK: - DignosisDiagnosticStudy
struct DignosisDiagnosticStudy: Decodable {
    let id, labName, labResult, labID: String?
}
// MARK: - SpecialTest
struct Reflexes: Decodable {
    let reflexName: String?
    let left: String?
    let right: String?
}

// MARK: - SpecialTest
struct SpecialTest: Decodable {
    let id: String?
    let test: [Test]?
    let bodyPart: String?
}
// MARK: - Test
struct Test: Decodable  {
    let id, testName, isLeftPass, isRightPass: String?
}
// MARK: - Strength
struct Strength: Decodable {
    let strengthLeft, strengthRight: Int?
    let id, strengthName: String?
}
// MARK: - PatientInWaitingRoom
struct PatientInWaitingRoom: Decodable {
    let treatmentPlanFollow: [String]?
    let fallsTraumaDetail: String?
    let fallsOrTrauma: Bool?
    let didInjectionHelp: String?
    let injectionHelpDetail, improveDetail, symptoms: String?
    let improveWithInjection: String?
    let painScale, companyName: String?
    let fullBodyCoordinates: [String]?
    let differentialDignosis: [DifferentialDignosis]?
}
// MARK: - DifferentialDignosi
struct DifferentialDignosis: Decodable  {
    let _id, desc, code: String?
}
// MARK: - Operation
struct OperationModel: Decodable {
    let _id: String?
    let patientAmbulating: PatientAmbulating?
    let isChecked: Bool?
    let patientAdmits, surgicalSiteExam, rangeOfMotion: [String]?
    let patientId, doctorId, problemId, companyName: String?
    let painScale, painCondition: String?
    let muscularStrengthTesting, reflexes: [MuscularStrengthTesting]?
    let diagnosticStudies: [DiagnosticStudy]?
    let cPTCode: [SurgicalHistory]?
    let treatmentPlan: [TreatmentPlan]?
    let surgicalHistory: [SurgicalHistory]?
    let patientName: String?
    let currentPatientMedication : [PatientMedicationModel]?
    let fullBodyCoordinates: [String]?
    let differentialDignosis: [DifferentialDignosis]?
    let createdAt : String?
}

//// MARK: - SurgicalHistory
//struct SurgicalHistory: Decodable {
//    let _id: String?
//    let recommendByDoctor: Bool?
//    let problemID, code, surgicalID, name: String?
//}
// MARK: - DiagnosticStudy
struct DiagnosticStudy: Decodable {
    let id: String?
}

// MARK: - MuscularStrengthTesting
struct MuscularStrengthTesting: Decodable {
    let id: String?
    let strengthName: String?
    let muscularStrengthTestingLeft, muscularStrengthTestingRight: String?
    let reflexName: String?
}

// MARK: - PatientAmbulating
struct PatientAmbulating: Decodable {
    let assistiveDevice: [String]?
    let ambulating: Bool?
}

// MARK: - SurgicalHistory
struct SurgicalHistory: Decodable {
    let recommendByDoctor: Bool?
    let id, name, code, problemId: String?
    let surgicalId: String?
}

// MARK: - TreatmentPlan
struct TreatmentPlan: Decodable {
    let id, treatmentName, treatmentDetail: String?
}

// MARK: - WaitingDataModel

struct WaitingDataModel: Decodable {
    
    let _id : String?
    let aggravatingFactors : [String]?
    let alleviatingFactors : [String]?
    let currentMedications : [currentIssueMedicationModel]?
    let currentPatientMedication : [currentPatientMedicationModel]?
    let fullBodyCoordinates : [String]?
    let injury : getInjuryModel?
    let patientID : String?
    let doctorId : String?
    let patientName : String?
    let previousTreatment : getPreviousTreatmentModel?
//    let radiationDistribution : [String]?
    let symptoms : [String]?
    let symptomsAtBest : String?
    let symptomsAtWorst : String?
    let symptomsDevelop : String?
    let symptomsDuration : String?
    let symptomsRadiation : getSymptomsRadiation?
    let symptomsStarted : String?
    let createdAt : String?
    let castNumber, roomNumber : String?
   
}

struct currentIssueMedicationModel:Decodable {
//    let currentMedications : [String]?
//    let newMedications : [String]?
    let name: String?
    let dose: String?
    let frequency: String?
    let frequencyasneeded: String?
}
struct currentPatientMedicationModel:Decodable {
//    let currentMedications : [String]?
//    let newMedications : [String]?
    let name: String?
    let dose: String?
    let frequency: String?
    let frequencyasneeded: String?
}
struct getInjuryModel:Decodable {
    let Details : String?
    let isInjury: Bool?
}
//struct getPreviousTreatmentModel:Decodable {
//    let isPreviousTreatment : Bool?
//    let otherTreatments : String?
//    let previousTreatmentInclude : [String]?
//}
struct getSymptomsRadiation:Decodable {
    let isRadiate: Bool?
    let radiateAt : [String]?
    let radiateDetails : String?
}

struct getPreviousTreatmentModel:Decodable {
    let physicalTherapy: PhysicalTherapy?
    let previousTreatmentInclude: [String]?
    let isPreviousTreatment: Bool?
    let otherTreatments: String?
    
    
}

// MARK: - PhysicalTherapy
struct PhysicalTherapy:Decodable {
    let numberOfSession, whenBegin: String?
}

