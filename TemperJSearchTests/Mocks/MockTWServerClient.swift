//
//  MockTWServerClient.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
import RxSwift
import XCTest
@testable import TemperJSearch

// ideally we should define a protocol for AppServerClient, no value here,just inherit
final class MockTWServerClient : TWServerClient {
    
    var getShiftsResult: Result<[TWContractor], TWServerClient.TWServerError>?
    
    override func getShifts(fromDate date: String) -> Observable<[TWContractor]> {
        return Observable.create{ observer in
            
            switch self.getShiftsResult {
            case .success(let contractors)?:
                    observer.onNext(contractors)
            case .failure(let error)?:
                    observer.onError(error)
            case .none:
                    observer.onError(TWServerClient.TWServerError.notFound)
            }
            
            return Disposables.create()
        }
    }
}
