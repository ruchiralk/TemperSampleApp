//
//  AppServerClient.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class TWServerClient {
    
    enum TWServerError : Int, Error {
        case unAuthorized = 401
        case notFound = 404
        case dataUnavailable = 2001
    }
    
    private let baseUrl = "https://temper.works/api/v2/"
    
    init(){
        
    }
    
    func getShifts(fromDate date: String) -> Observable<[TWContractor]> {
        return Observable.create({ [unowned self](observer) -> Disposable in
            let resource = self.baseUrl + "contractor/shifts"
            let parameters: Parameters = ["dates": date]
            AF.request(resource, parameters: parameters)
                .validate()
                .responseJSON { response in
                    switch response.result {
                        case .success:
                            guard let data = response.data else {
                                observer.onError(response.error ?? TWServerError.dataUnavailable)
                                return
                            }
                        
                            do {
                                let payload = try JSONDecoder().decode(TWResponse<[String: [TWContractor]]>.self, from: data)
                                observer.onNext(payload.data[date] ?? [])
                            }catch{
                                observer.onError(error)
                            }
                        case .failure(let error):
                            observer.onError(error)
                    }
                }
            return Disposables.create()
        })
    }
}
