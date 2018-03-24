//
//  firstTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 24/03/2018.
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

class FirstTests: XCTestCase {
    func test_filter_empty() {
        let data: [TestData] = []
        
        XCTAssertNil(data.first(where: \.bool))
        
        XCTAssertNil(data.first(where: \.bool == true))
        XCTAssertNil(data.first(where: \.string == "first"))

    }
    
    func test_filter_allValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: true)]
        
        XCTAssertEqual(data.first(where: \.bool), TestData(string: "first", bool: true))
        
        XCTAssertEqual(data.first(where: \.bool == true), TestData(string: "first", bool: true))
        XCTAssertEqual(data.first(where: \.string.count > 2), TestData(string: "first", bool: true))
    }
    
    func test_filter_someValues() {
        let data: [TestData] = [TestData(string: "first", bool: false),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: false)]
        
        XCTAssertEqual(data.first(where: \.bool), TestData(string: "second", bool: true))
        
        XCTAssertEqual(data.first(where: \.bool == true), TestData(string: "second", bool: true))
        XCTAssertEqual(data.first(where: \.string == "third"), TestData(string: "third", bool: false))
    }
    
    func test_filter_noValue() {
        let data: [TestData] = [TestData(string: "first", bool: false),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: false)]
        
        XCTAssertNil(data.first(where: \.bool))
        
        XCTAssertNil(data.first(where: \.bool == true))
        XCTAssertNil(data.first(where: \.string == "fourth"))
    }
}
