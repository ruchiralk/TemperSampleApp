//
//  JSViewModelTest.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import TemperJSearch

class JSViewModelTests: XCTestCase {
    
    var disposeBag: DisposeBag!
    var twServerClient: MockTWServerClient!
    
    override func setUp() {
       disposeBag = DisposeBag()
       twServerClient = MockTWServerClient()
    }
    
    
    func testSearchResultsFailure(){
        twServerClient.getShiftsResult = .failure(TWServerClient.TWServerError.notFound)
        let viewModel =  JSViewModel(appServerClient: twServerClient)
        let expectErrorSearchFailed = expectation(description: "Search for shifts returned error")
        viewModel.searchResults
            .skip(1)
            .subscribe { (event) in
                XCTAssertNotNil(event.element)
                XCTAssertTrue(event.element!.isEmpty)
                expectErrorSearchFailed.fulfill()
        }
        .disposed(by: disposeBag)
        viewModel.selectedDate.onNext(Date())
        wait(for: [expectErrorSearchFailed], timeout: 0.1)
        
    }
    
    func testSearchResultsSuccessWithResults(){
        let resultsCount = 5
        twServerClient.getShiftsResult = .success(Array.init(repeating: TWContractor.with(), count: resultsCount))
        let viewModel =  JSViewModel(appServerClient: twServerClient)
        let expectSuccessForSearchResults = expectation(description: "Search for shifts returned results")
        viewModel.searchResults
            .skip(1)
            .subscribe { (event) in
                XCTAssertNotNil(event.element)
                XCTAssertEqual(event.element!.count, resultsCount)
                expectSuccessForSearchResults.fulfill()
            }
            .disposed(by: disposeBag)
        viewModel.selectedDate.onNext(Date())
        wait(for: [expectSuccessForSearchResults], timeout: 0.1)
    }
    
    func testSearchResultsSuccessWithEmptyResults(){
       let viewModel =  JSViewModel(appServerClient: twServerClient)
        let resultsCount = 0
        twServerClient.getShiftsResult = .success(Array.init(repeating: TWContractor.with(), count: resultsCount))
        
        let expectSuccessForSearchResults = expectation(description: "Search for shifts returned empty results set")
        viewModel.searchResults
            .skip(1)
            .subscribe { (event) in
                XCTAssertNotNil(event.element)
                XCTAssertTrue(event.element!.count == resultsCount, "Search returned invalid result count")
                expectSuccessForSearchResults.fulfill()
            }
            .disposed(by: disposeBag)
        viewModel.selectedDate.onNext(Date())
        wait(for: [expectSuccessForSearchResults], timeout: 0.1)
    }
    
    
    func testIsActiveState(){
        let resultsCount = 5
        twServerClient.getShiftsResult = .success(Array.init(repeating: TWContractor.with(), count: resultsCount))
         let viewModel = JSViewModel(appServerClient: twServerClient)
        
        let scheduler = TestScheduler(initialClock: 0)
        let result = scheduler.createObserver(Bool.self) // test isActive Observable switch correct between true and false
        
        viewModel.isActive
            .asObserver()
            .bind(to: result)
            .disposed(by: disposeBag)
        
        scheduler.createColdObservable([
                .next(100, Date()) // emite date filter changes
            ])
        .bind(to: viewModel.selectedDate)
        .disposed(by: disposeBag)
        
        scheduler.start()
        
        let expectedEvents = [
            Recorded.next(100, true),
            Recorded.next(100, false)
        ]
        
        XCTAssertEqual(result.events, expectedEvents)
    }
}
