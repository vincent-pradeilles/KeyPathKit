//
//  dropTests.swift
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

class DropTests: XCTestCase {
    
    func test_drop_empty() {
        let data: [TestData] = []
    
        XCTAssertEqual(Array(data.drop(while: \.bool)) , [])
        XCTAssertEqual(Array(data.drop(while: \.bool == true)), [])
        XCTAssertEqual(Array(data.drop(while: \.string == "first")), [])
    }
    
    func test_drop_allValues() {
        let data: [TestData] = [TestData(string: "first", bool: false),
                                TestData(string: "second", bool: false),
                                TestData(string: "third", bool: false)]
        
        XCTAssertEqual(Array(data.drop(while: \.bool)), data)
        
        XCTAssertEqual(Array(data.drop(while: \.bool == true)), data)
        XCTAssertEqual(Array(data.drop(while: \.string == "fourth")), data)
    }
    
    func test_drop_someValues() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: false)]
        
        XCTAssertEqual(Array(data.drop(while: \.bool)), [TestData(string: "third", bool: false)])
        
        XCTAssertEqual(Array(data.drop(while: \.bool == true)), [TestData(string: "third", bool: false)])
        XCTAssertEqual(Array(data.drop(while: \.string == "first")), [TestData(string: "second", bool: true), TestData(string: "third", bool: false)])
    }
    
    func test_drop_noValue() {
        let data: [TestData] = [TestData(string: "first", bool: true),
                                TestData(string: "second", bool: true),
                                TestData(string: "third", bool: true)]
        
        XCTAssertEqual(Array(data.drop(while: \.bool)), [])
        
        XCTAssertEqual(Array(data.drop(while: \.bool == true)), [])
        XCTAssertEqual(Array(data.drop(while: !\.string.isEmpty)), [])
    }
}
