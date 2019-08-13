//
//  AppServerResponse.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation

struct TWResponse<T> : Codable where T : Codable {
    let data:T
}
