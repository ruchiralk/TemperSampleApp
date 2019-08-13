//
//  PhotoFormat.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation

struct TWPhoto : Codable {
    let formats: [TWPhotoFormat]?
}

struct TWPhotoFormat  : Codable {
    let cdnUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cdnUrl = "cdn_url"
    }
}
