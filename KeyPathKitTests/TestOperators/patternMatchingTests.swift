//
//  patternMatchingTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 06/01/2019.
//  Copyright © 2019 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string: String
    let bool: Bool
}

class PatternMatchingTests: XCTestCase {
    
    func test_switching() {
        let data = TestData(string: "second", bool: true)
        
        switch data {
        case \.string == "second":
            XCTAssertEqual(data.string, "second")
        case \.bool == true:
            XCTAssertTrue(data.bool)
        default:
            break
        }
    }
}
