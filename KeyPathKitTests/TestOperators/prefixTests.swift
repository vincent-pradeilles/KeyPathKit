//
//  prefixTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 31/03/2018.
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

class PrexifTests: XCTestCase {
    
    func test_prefix_empty() {
        let data: [TestData] = []
        
        XCTAssertEqual(data.prefix(while: \.bool), [])
        XCTAssertEqual(data.prefix(while: \.bool == true), [])
        XCTAssertEqual(data.prefix(while: \.string == "first"), [])
    }
    
    func test_prefix_allValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: true)]
        
        XCTAssertEqual(Array(data.prefix(while: \.bool)), data)
        
        XCTAssertEqual(Array(data.prefix(while: \.bool == true)), data)
        XCTAssertEqual(Array(data.prefix(while: \.string == "first" || \.string == "second" || \.string == "third")), data)
    }
    
    func test_prefix_someValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: false)]
        
        XCTAssertEqual(Array(data.prefix(while: \.bool)), [TestData(string: "first", bool: true), TestData(string: "second", bool: true)])
        
        XCTAssertEqual(Array(data.prefix(while: \.bool == true)), [TestData(string: "first", bool: true), TestData(string: "second", bool: true)])
        XCTAssertEqual(Array(data.prefix(while: \.string == "first")), [TestData(string: "first", bool: true)])
    }
    
    func test_prefix_noValue() {
        let data: [TestData] = [TestData(string: "first", bool: false),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: false)]
        
        XCTAssertEqual(Array(data.prefix(while: \.bool)), [])
        
        XCTAssertEqual(Array(data.prefix(while: \.bool == true)), [])
        XCTAssertEqual(Array(data.prefix(while: \.string.isEmpty)), [])
    }
}
