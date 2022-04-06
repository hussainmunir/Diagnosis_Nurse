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
var doctor_ID = String()
var patient_name = String()
var problem_id = String()

var waitingListCommbineArray = [WaitingAllCombineDataModel]()
var waitingListCommbineArrayAll = [WaitingAllCombineDataModel]()

var labsWaitingArray = [LabsWaitingDataModel]()

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

var doctor_post_problemID = String()

var followUp_post_obj_ID = "618b6e78fa3ea064538dabfc"
var followUp_post_problemID = "618b6e78fa3ea064538dabfc"

var postOp_post_obj_ID = String()
var postOp_post_problemID = String()

var vitalsDic_nurse = [String:Any]()

var patient_lab_detail_index_path = Int()

var lab_Photos : Array<Media> = []
var lab_docs : Array<Media1> = []


var Global_nurse_Id = String()
var Global_nurse_Email = String()
var Global_nurse_EmergencyContact = Int()
var Global_nurse_homeAddress = String()
var Global_nurse_name = String()
var Global_nurse_password = String()
var Global_nurse_phone = Int()
var Global_nurse_companyName = String()
var Global_nurse_dea = String()
var Global_nurse_npi = String()



var timeStamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
