//
//  Client.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation

struct TWClient : Codable {
    let name: String?
    let id: String?
    let photos: [TWPhoto]?
    let description: String?
    let factoringAllowed: Bool?
    let factoringPaymentTermInDays: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case photos
        case description
        case factoringAllowed = "factoring_allowed"
        case factoringPaymentTermInDays = "factoring_payment_term_in_days"
    }
}
