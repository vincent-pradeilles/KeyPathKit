//
//  filterMoreTests.swift
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

class FilterMoreTests: XCTestCase {
    
    func test_filterMore_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.filter(where: \.int, moreThan: 2).isEmpty)
        XCTAssertTrue(data.filter(where: \.double, moreThan: 2.0).isEmpty)
        
        XCTAssertTrue(data.filter(where: \.int > 2).isEmpty)
        XCTAssertTrue(data.filter(where: \.double > 2.0).isEmpty)
    }
    
    func test_filterMore_allValues() {
        let data: [TestData] = [TestData(int: 3, double: 4.5),
                                TestData(int: -2, double: 5e4),
                                TestData(int: 100, double: -2300)]
        
        XCTAssertEqual(data.filter(where: \.int, moreThan: -3), data)
        XCTAssertEqual(data.filter(where: \.int, moreOrEqual: -2), data)
        XCTAssertEqual(data.filter(where: \.double, moreThan: -2301.0), data)
        XCTAssertEqual(data.filter(where: \.double, moreOrEqual: -2300.0), data)
        
        XCTAssertEqual(data.filter(where: \.int > -3), data)
        XCTAssertEqual(data.filter(where: \.int >= -2), data)
        XCTAssertEqual(data.filter(where: \.double > -2301.0), data)
        XCTAssertEqual(data.filter(where: \.double >= -2300.0), data)
    }
    
    func test_filterMore_someValues() {
        let data: [TestData] = [TestData(int: 3, double: 4.5),
                                TestData(int: -2, double: 5e4),
                                TestData(int: 100, double: -2300)]
        
        XCTAssertEqual(data.filter(where: \.int, moreThan: 1), [TestData(int: 3, double: 4.5), TestData(int: 100, double: -2300)])
        XCTAssertEqual(data.filter(where: \.double, moreOrEqual: 4.5), [TestData(int: 3, double: 4.5), TestData(int: -2, double: 5e4)])
        
        XCTAssertEqual(data.filter(where: \.int > 1), [TestData(int: 3, double: 4.5), TestData(int: 100, double: -2300)])
        XCTAssertEqual(data.filter(where: \.double >= 4.5), [TestData(int: 3, double: 4.5), TestData(int: -2, double: 5e4)])
    }
    
    func test_filterMore_noValue() {
        let data: [TestData] = [TestData(int: 3, double: 4.5),
                                TestData(int: -2, double: 5e4),
                                TestData(int: 100, double: -2300)]
        
        XCTAssertEqual(data.filter(where: \.int, moreThan: 100), [])
        XCTAssertEqual(data.filter(where: \.double, moreOrEqual: (5e4 + 1.0)), [])
        
        XCTAssertEqual(data.filter(where: \.int > 100), [])
        XCTAssertEqual(data.filter(where: \.double >= (5e4 + 1.0)), [])
    }
}
