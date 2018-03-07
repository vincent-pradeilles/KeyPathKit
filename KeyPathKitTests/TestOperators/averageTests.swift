//
//  averageTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let int: Int
    let float: Float
    let double: Double
}

private func areEqual(_ lhs: Double, _ rhs: Double) -> Bool {
    return abs(lhs - rhs) < 1e-3
}

class AverageTests: XCTestCase {
    
    func test_average_empty() {
        let data: [TestData] = []
                
        XCTAssert(data.average(\.int).isNaN)
        XCTAssert(data.average(\.float).isNaN)
        XCTAssert(data.average(\.double).isNaN)
    }
    
    func test_average_values() {
        let data: [TestData] = [TestData(int: 0, float: 9.4, double: -1.0),
                                TestData(int: -3, float: 9.4, double: 65.0),
                                TestData(int: 9, float: 9.4, double: 2.5),
                                TestData(int: 70, float: 9.4, double: 8.0),
                                TestData(int: 2, float: 9.4, double: -2.43),
                                TestData(int: 7, float: 9.4, double: 5.0),]
        
        XCTAssert(areEqual(data.average(\.int), 14.166))
        XCTAssert(areEqual(data.average(\.float), 9.4))
        XCTAssert(areEqual(data.average(\.double), 12.845))
    }
}
