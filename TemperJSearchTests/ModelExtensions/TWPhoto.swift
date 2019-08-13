//
//  TWPhoto.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
@testable import TemperJSearch

extension TWPhoto{
    static func with(formats: [TWPhotoFormat]? = [TWPhotoFormat.with()]) -> TWPhoto{
        return TWPhoto(formats: formats)
    }
}

extension TWPhotoFormat {
    static func with(cdnUrl: String? = nil) -> TWPhotoFormat{
        return TWPhotoFormat(cdnUrl: cdnUrl)
    }
}
