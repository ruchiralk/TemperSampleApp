//
//  Shift.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation

struct TWShift : Codable {
    let tempersNeeded: Int?
    let earningsPerHour: Double?
    let duration: Int?
    let currency: String?
    let startDate: String?
    let startTime: String?
    let startDatetime: String?
    let endTime: String?
    let endDatetime: String?
    let isAutoAcceptedWhenAppliedFor: Int?
    
    enum CodingKeys: String, CodingKey {
        case tempersNeeded = "tempers_needed"
        case earningsPerHour = "earnings_per_hour"
        case duration
        case currency
        case startDate = "start_date"
        case startTime = "start_time"
        case startDatetime = "start_datetime"
        case endTime = "end_time"
        case endDatetime = "end_datetime"
        case isAutoAcceptedWhenAppliedFor = "is_auto_accepted_when_applied_for"
    }
}
