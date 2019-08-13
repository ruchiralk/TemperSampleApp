//
//  TWContractor.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWContractor {
    static func with(title: String? = "Enthousiaste team players bediening",
                     id: Int? = 19011,
                     key: String? = "89yypz",
                     date: TWDate? = TWDate.with(),
                     allowsFactoring: Bool = true,
                     location: TWLocation? = TWLocation.with(),
                     distance: String? = nil,
                     url: String? = nil,
                     maxPossibleEarningsHour: Double? = 16.5,
                     maxPossibleEarningsTotal: Double? = 99,
                     client: TWClient? = TWClient.with(),
                     jobCategory: TWJobCategory? = TWJobCategory.with(),
                     openPositions: Int? = 1,
                     newMatchesCount: Int? = 1,
                     photo: String? = nil,
                     shifts: [TWShift] = [TWShift.with()])-> TWContractor{
        
        return TWContractor(title: title,
                            id: id,
                            key: key,
                            date: date,
                            allowsFactoring: allowsFactoring,
                            location: location,
                            distance: distance,
                            url: url,
                            maxPossibleEarningsHour: maxPossibleEarningsHour,
                            maxPossibleEarningsTotal: maxPossibleEarningsTotal,
                            client: client,
                            jobCategory: jobCategory,
                            openPositions: openPositions,
                            newMatchesCount: newMatchesCount,
                            photo: photo,
                            shifts: shifts)
    }
}
