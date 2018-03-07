//
//  mapTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string: String
}

class MapTests: XCTestCase {
    
    func test_map_empty() {
        let data: [TestData] = []
        
        XCTAssertEqual(data.map(\.string), [])
    }
    
    func test_map_values() {
        let data = [TestData(string: "one"), TestData(string: "two"), TestData(string: "three")]
        
        let expected = ["one", "two", "three"]
        
        XCTAssertEqual(data.map(\.string), expected)
    }
}
