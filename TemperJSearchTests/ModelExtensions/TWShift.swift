//
//  TWShift.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWShift {
    static func with(tempersNeeded:Int? = 1,
                     earningsPerHour:Double? = 16.5,
                     duration:Int? = 6,
                     currency:String? = "EUR",
                     startTime:String? = "2019-07-28",
                     startDatetime:String? = "2019-07-28 18:00:00",
                     endTime:String? = "00:00",
                     endDatetime:String? = "2019-07-29 00:00:00",
                     isAutoAcceptedWhenAppliedFor: Int? = 0) -> TWShift{
        
        return TWShift(tempersNeeded: tempersNeeded,
                       earningsPerHour: earningsPerHour,
                       duration: duration,
                       currency: currency,
                       startDate: startTime,
                       startTime: startTime,
                       startDatetime: startDatetime,
                       endTime: endTime,
                       endDatetime: endDatetime,
                       isAutoAcceptedWhenAppliedFor: isAutoAcceptedWhenAppliedFor)
    }
}
