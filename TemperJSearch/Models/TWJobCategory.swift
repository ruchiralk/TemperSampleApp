//
//  JobCategory.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation

struct TWJobCategory : Codable {
    let description: String?
    let iconPath: String?
    let slug: String?
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconPath = "icon_path"
        case slug
    }
}
