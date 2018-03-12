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
    let bool1: Bool
    let bool2: Bool
}

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.string == rhs.string
            && lhs.bool1 == rhs.bool1
            && lhs.bool2 == rhs.bool2
    }
}

class FilterTests: XCTestCase {
    
    func test_filter_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.filter(where: \.bool1).isEmpty)
    }
    
    func test_filter_allValues() {
        let data: [TestData] = [TestData(string: "first", bool1: true, bool2: true),
                                TestData(string: "second", bool1: true, bool2: true),
                                TestData(string: "third", bool1: true, bool2: true)]
        
        XCTAssertEqual(data.filter(where: \.bool1), data)
        XCTAssertEqual(data.filter(where: \.bool1, \.bool2), data)
        
        XCTAssertEqual(data.filter(where: \.bool1 == \.bool2), data)
    }
    
    func test_filter_someValues() {
        let data: [TestData] = [TestData(string: "first", bool1: true, bool2: false),
                                TestData(string: "second", bool1: false, bool2: true),
                                TestData(string: "third", bool1: true, bool2: true)]
        
        XCTAssertEqual(data.filter(where: \.bool1), [TestData(string: "first", bool1: true, bool2: false), TestData(string: "third", bool1: true, bool2: true)])
        XCTAssertEqual(data.filter(where: \.bool1, \.bool2), [TestData(string: "third", bool1: true, bool2: true)])
        
        XCTAssertEqual(data.filter(where: \.bool1 == \.bool2), [TestData(string: "third", bool1: true, bool2: true)])
        XCTAssertEqual(data.filter(where: \.bool1 != \.bool2), [TestData(string: "first", bool1: true, bool2: false), TestData(string: "second", bool1: false, bool2: true)])
    }
    
    func test_filter_noValue() {
        let data: [TestData] = [TestData(string: "first", bool1: false, bool2: true),
                                TestData(string: "second", bool1: false, bool2: true),
                                TestData(string: "third", bool1: false, bool2: true)]
        
        XCTAssertEqual(data.filter(where: \.bool1), [])
        XCTAssertEqual(data.filter(where: \.bool1, \.bool2), [])
        
        XCTAssertEqual(data.filter(where: \.bool1 == \.bool2), [])
    }
}
