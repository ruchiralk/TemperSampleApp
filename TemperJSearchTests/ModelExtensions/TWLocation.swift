//
//  TWLocation.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWLocation {
    static func with(lat: String? = "52.333851",
                     lng: String? = "5.221078") -> TWLocation{
        
        return TWLocation(lat: lat,
                          lng: lng)
    }
}
