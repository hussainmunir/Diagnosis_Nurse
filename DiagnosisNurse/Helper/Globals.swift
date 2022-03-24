//
//  Globals.swift
//  DiagnosisNurse
//
//  Created by YamTech on 23/03/2022.
//

import Foundation
import UIKit


struct K {
static let mainURL = "http://ec2-44-202-39-201.compute-1.amazonaws.com:5000"
}

var authToken : String = ""
var tokencheck = false
var getToken = String()

var patient_ID = String()

var waitingListCommbineArray = [WaitingAllCombineDataModel]()

var waitingListProblem = [WaitingDataModel]()

var global_systemReview_object: PatientReviewSystem?

var global_patient_allergies = [AllergiesDataModel]()

var hpi_review_array_index_path = Int()
var detailMedicines = [String]()
var detailAllergies = [String]()

var RoomNumber = String()
var castRoom = String()
var vitalsDic = [String:Any]()
var xraysDescription = String()


