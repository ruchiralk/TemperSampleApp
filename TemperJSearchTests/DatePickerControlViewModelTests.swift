//
//  DatePickerControlTests.swift
//  TemperJSearchTests
//
//  Created by Ruchira Munidasa on 29/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import XCTest
import Foundation
@testable import TemperJSearch

class DatePickerControlViewModelTests: XCTestCase {

    
    func testDateFromCurrentDate(){
        let viewModel = DatePickerControlViewModel()
        let currentDate = Date()
        viewModel.selectedDate.accept(currentDate)
        
        let threeDaysAhead =  currentDate.addingTimeInterval(60 * 60 * 24 * 3)
        let viewModelDateResult = viewModel.dateFromCurrentDate(ahead: 3)
        XCTAssertNotNil(viewModelDateResult)
        XCTAssertEqual(threeDaysAhead.timeIntervalSinceReferenceDate, viewModelDateResult!.timeIntervalSinceReferenceDate, accuracy: 0.0001)
        
    }
    
    func testDateStringInMMMDFormat(){
         let viewModel = DatePickerControlViewModel()
        
        let testDateStr = "2017-05-22"
        let testDateFormat = "yyyy-MM-dd"
        let expectedResult = "May 22"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = testDateFormat
        let date = dateFormatter.date(from: testDateStr)
        
        XCTAssertNotNil(date)
        XCTAssertEqual(expectedResult, viewModel.dateStringInMMMDFormat(date: date!))
    }
}
