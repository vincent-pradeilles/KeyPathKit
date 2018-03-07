//
//  distinctTests.swift
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

class DistinctTests: XCTestCase {
    
    func test_distinct() {
        let data = [TestData(string: "one"),
                    TestData(string: "two"),
                    TestData(string: "one"),
                    TestData(string: "three")]
        
        XCTAssertEqual(data.distinct(\.string), ["one", "two", "three"])
    }
}
