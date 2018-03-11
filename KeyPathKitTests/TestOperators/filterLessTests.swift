//
//  filterLessTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 11/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let int: Int
    let double: Double
}

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.int == rhs.int
            && lhs.double == rhs.double
    }
}

class FilterLessTests: XCTestCase {
    
    func test_filterLess_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.filter(where: \.int, lessThan: 2).isEmpty)
        XCTAssertTrue(data.filter(where: \.double, lessThan: 2.0).isEmpty)
    }
    
    func test_filterLess_allValues() {
        let data: [TestData] = [TestData(int: 3, double: 4.5),
                                TestData(int: -2, double: 5e4),
                                TestData(int: 100, double: -2300)]
        
        XCTAssertEqual(data.filter(where: \.int, lessThan: 200), data)
        XCTAssertEqual(data.filter(where: \.int, lessOrEqual: 100), data)
        XCTAssertEqual(data.filter(where: \.double, lessThan: 6e4), data)
        XCTAssertEqual(data.filter(where: \.double, lessOrEqual: 5e4), data)
    }
    
    func test_filterLess_someValues() {
        let data: [TestData] = [TestData(int: 3, double: 4.5),
                                TestData(int: -2, double: 5e4),
                                TestData(int: 100, double: -2300)]
        
        XCTAssertEqual(data.filter(where: \.int, lessThan: 100), [TestData(int: 3, double: 4.5), TestData(int: -2, double: 5e4)])
        XCTAssertEqual(data.filter(where: \.double, lessThan: 100.0), [TestData(int: 3, double: 4.5), TestData(int: 100, double: -2300)])
    }
    
    func test_filterLess_noValue() {
        let data: [TestData] = [TestData(int: 3, double: 4.5),
                                TestData(int: -2, double: 5e4),
                                TestData(int: 100, double: -2300)]
        
        XCTAssertEqual(data.filter(where: \.int, lessThan: -5), [])
        XCTAssertEqual(data.filter(where: \.double, lessOrEqual: -2301), [])
    }
}
