//
//  flatMapTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let strings: [String]
}

class FlatMapTests: XCTestCase {
    
    func test_flatMap_empty() {
        let data: [TestData] = []
        
        XCTAssertEqual(data.flatMap(\.strings), [])
    }
    
    func test_flatMap_values() {
        let data = [TestData(strings: ["one"]), TestData(strings: ["two", "three"]), TestData(strings: [])]
        
        let expected = ["one", "two", "three"]
        
        XCTAssertEqual(data.flatMap(\.strings), expected)
    }
}
