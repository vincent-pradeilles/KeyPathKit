//
//  containsTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 30/03/2018.
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

class ContainsTests: XCTestCase {
    
    func test_contains_empty() {
        let data: [TestData] = []
        
        XCTAssertFalse(data.contains(where: \.bool))
        XCTAssertFalse(data.contains(where: \.string == "first"))
        XCTAssertFalse(data.contains(where: \.bool == true))
    }
    
    func test_contains_allValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: true)]
        
        XCTAssertTrue(data.contains(where: \.bool))
        
        XCTAssertTrue(data.contains(where: \.bool == true))
        XCTAssertTrue(data.contains(where: !\.string.isEmpty))
    }
    
    func test_contains_someValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: true)]
        
        XCTAssertTrue(data.contains(where: \.bool))
        
        XCTAssertTrue(data.contains(where: \.bool == true))
        XCTAssertTrue(data.contains(where: \.string == "second"))
    }
    
    func test_contains_noValue() {
        let data: [TestData] = [TestData(string: "first", bool: false),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: false)]
        
        XCTAssertFalse(data.contains(where: \.bool))
        
        XCTAssertFalse(data.contains(where: \.bool == true))
        XCTAssertFalse(data.contains(where: \.string.isEmpty))
    }
}
