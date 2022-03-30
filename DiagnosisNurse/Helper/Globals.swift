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

var global_RoomNumber = String()
var global_castRoom = String()
var vitalsDic = [String:Any]()
var xraysDescription = String()

var followUp_post_obj_ID = "618b6e78fa3ea064538dabfc"
var followUp_post_problemID = "618b6e78fa3ea064538dabfc"

var vitalsDic_nurse = [String:Any]()




