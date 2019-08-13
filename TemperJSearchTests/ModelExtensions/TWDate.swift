//
//  TWDate.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWDate {
    static func with(date: String = "2019-07-28 18:00:00",
                     timezoneType: Int? = 3,
                     timeZone: String? = "Europe/Amsterdam") -> TWDate{
        
        return TWDate(date: date,
                      timezoneType: timezoneType,
                      timezone: timeZone)
    }
}
