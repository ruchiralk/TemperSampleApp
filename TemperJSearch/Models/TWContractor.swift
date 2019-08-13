//
//  JobSearchResult.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 27/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation

struct TWContractor : Codable {
    let title: String?
    let id: Int?
    let key: String?
    let date: TWDate?
    let allowsFactoring: Bool
    let location: TWLocation?
    let distance: String?
    let url: String?
    let maxPossibleEarningsHour: Double?
    let maxPossibleEarningsTotal: Double?
    let client: TWClient?
    let jobCategory: TWJobCategory?
    let openPositions: Int?
    let newMatchesCount: Int?
    let photo: String?
    let shifts: [TWShift]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case id
        case key
        case date
        case allowsFactoring = "allows_factoring"
        case location
        case distance
        case url
        case maxPossibleEarningsHour = "max_possible_earnings_hour"
        case maxPossibleEarningsTotal = "max_possible_earnings_total"
        case client
        case jobCategory = "job_category"
        case openPositions = "open_positions"
        case newMatchesCount = "new_matches_count"
        case photo
        case shifts
    }
}
