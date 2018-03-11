//
//  filterTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string: String
    let bool: Bool
}

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.string == rhs.string
            && lhs.bool == rhs.bool
    }
}

class FilterTests: XCTestCase {
    
    func test_filter_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.filter(where: \.bool).isEmpty)
    }
    
    func test_filter_allValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: true)]
        
        XCTAssertEqual(data.filter(where: \.bool), data)
    }
    
    func test_filter_someValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: true)]
        
        XCTAssertEqual(data.filter(where: \.bool), [TestData(string: "first", bool: true), TestData(string: "third", bool: true)])
    }
    
    func test_filter_noValue() {
        let data: [TestData] = [TestData(string: "first", bool: false),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: false)]
        
        XCTAssertEqual(data.filter(where: \.bool), [])
    }
}
