//
//  sumTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let int: Int
    let double: Double
}

class SumTests: XCTestCase {
    
    func test_sum_empty() {
        let data: [TestData] = []
        
        XCTAssertEqual(data.sum(by: \.int), 0)
        XCTAssertEqual(data.sum(by: \.double), 0.0)
    }
    
    func test_sum_values() {
        let data: [TestData] = [TestData(int: 0, double: -1.0),
                                TestData(int: -3, double: 65.0),
                                TestData(int: 9, double: 2.5),
                                TestData(int: 70, double: 8.0),
                                TestData(int: 2, double: -2.43),
                                TestData(int: 7, double: 5.0),]
        
        XCTAssertEqual(data.sum(by: \.int), 85)
        XCTAssertEqual(data.sum(by: \.double), 77.07)
    }
}
