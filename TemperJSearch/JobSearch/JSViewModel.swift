//
//  JSViewModel.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class JSViewModel {
    
    private let disposeBag = DisposeBag()
    var searchResults = PublishSubject<[TWContractor]>()
    var isActive = PublishSubject<Bool>()
    var selectedDate = PublishSubject<Date>()
    var selectedDateStr = PublishSubject<String>()
    private lazy var dateFormatter = {
       return DateFormatter()
    }()
    private let appServerClient: TWServerClient
    
    init(appServerClient: TWServerClient = TWServerClient()) { // inject AppServerClient in order to make viewmodel testable
        self.appServerClient = appServerClient
        bind()
    }
    
    private func bind(){
        // convert selectedDate to DateStr
        selectedDate.asObservable()
        .distinctUntilChanged()
            .subscribe { [weak self](event) in
                guard let date = event.element else {
                    return
                }
                self?.dateFormatter.dateFormat = "yyyy-MM-dd"
                if let dateStr = self?.dateFormatter.string(from: date) {
                    self?.selectedDateStr.onNext(dateStr)
                }
        }
        .disposed(by: disposeBag)
        
        // fetch latest results from API whenver selectedDate change
        selectedDateStr.asObservable()
        .distinctUntilChanged()
            .subscribe { [weak self](event) in
                guard let dateStr = event.element else {
                    return
                }
                self?.getShfits(dateStr: dateStr)
        }
        .disposed(by: disposeBag)
    }
    
    private func getShfits(dateStr: String){
        //self.searchResults.accept([])
        self.searchResults.onNext([])
        self.isActive.onNext(true)
        
        appServerClient
            .getShifts(fromDate: dateStr)
            .asObservable()
            .subscribe(
                onNext: { (contractors) in
                    self.isActive.onNext(false)
                    self.searchResults.onNext(contractors)
                    //self.searchResults.accept(contractors)
                },
                onError: { (error) in
                    // log error
                    self.searchResults.onNext([])
                    self.isActive.onNext(false)
            }
            ).disposed(by: self.disposeBag)
    }
}

