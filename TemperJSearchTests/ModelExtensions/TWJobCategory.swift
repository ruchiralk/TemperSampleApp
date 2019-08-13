//
//  TWJobCategory.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWJobCategory {
    static func with(description: String? = "Bediening",
                     slug: String? = "bediening",
                     iconPath: String? = nil) -> TWJobCategory{
        
        return TWJobCategory(description: description,
                             iconPath: iconPath,
                             slug: slug)
    }
}
