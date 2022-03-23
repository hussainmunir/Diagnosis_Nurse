//
//  HPIReviewModel.swift
//  DiagnosisNurse
//
//  Created by YamTech on 23/03/2022.
//

import Foundation

struct reviewStruct {
    let name: String
    let values: [String]
    init(n:String,v:[String]) {
        self.name = n
        self.values = v
    }
}

