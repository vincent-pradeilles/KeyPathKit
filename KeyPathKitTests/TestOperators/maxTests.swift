//
//  maxTests.swift
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

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.int == rhs.int
            && lhs.double == rhs.double
    }
}

class MaxTests: XCTestCase {
    
    func test_max_empty() {
        let data: [TestData] = []
        
        XCTAssertNil(data.max(by: \.int))
        XCTAssertNil(data.max(by: \.double))
    }
    
    func test_max_values() {
        let data: [TestData] = [TestData(int: 0, double: -1.0),
                                TestData(int: -3, double: 65.0),
                                TestData(int: 9, double: 2.5),
                                TestData(int: 70, double: 8.0),
                                TestData(int: 2, double: -2.43),
                                TestData(int: 7, double: 5.0),]
        
        XCTAssertEqual(data.max(by: \.int), TestData(int: 70, double: 8.0))
        XCTAssertEqual(data.max(by: \.double), TestData(int: -3, double: 65.0))
    }
}
