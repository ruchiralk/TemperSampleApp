//
//  TWClient.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWClient {
    static func with(name: String? = "Restaurant Bij Brons",
                     id: String? = "xezvz6",
                     photos: [TWPhoto] = [TWPhoto.with()],
                     description: String? = nil,
                     factoringAllowed: Bool? = true,
                     factoringPaymentTermInDays:Int? = 3) -> TWClient{
        
        return TWClient(name: name,
                        id: id,
                        photos: photos,
                        description: description,
                        factoringAllowed: factoringAllowed,
                        factoringPaymentTermInDays: factoringPaymentTermInDays)
    }
}
