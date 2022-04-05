//
//  LabsWaitingModel.swift
//  DiagnosisNurse
//
//  Created by YamTech on 05/04/2022.
//


import Foundation

// MARK: - Welcome
struct LabsWaitingModel: Decodable {
    let success: Bool?
    let data: [LabsWaitingDataModel]?
}

// MARK: - Datum
struct LabsWaitingDataModel: Decodable {
    let _id, patientId, doctorId, name: String?
    let date, description, progress, companyName: String?
    let photos, pdf: [PDF]?
    let patientName, byDesignation: String?
}

// MARK: - PDF
struct PDF: Decodable {
    let _id: String?
    let url: String?
    let public_id: String?
}
