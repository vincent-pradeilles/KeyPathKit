//
//  andTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let bool: Bool
}

class AndTests: XCTestCase {
    
    func test_and_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.and(\.bool))
    }
    
    func test_and_allTrue() {
        let data = [TestData(bool: true), TestData(bool: true), TestData(bool: true)]
        
        XCTAssertTrue(data.and(\.bool))
    }
    
    func test_and_allFalse() {
        let data = [TestData(bool: false), TestData(bool: false), TestData(bool: false)]
        
        XCTAssertFalse(data.and(\.bool))
    }
    
    func test_and_mixed() {
        let data = [TestData(bool: true), TestData(bool: false), TestData(bool: true)]
        
        XCTAssertFalse(data.and(\.bool))
    }

    func test_infinite_sequence() {
        var i = 0
        let data = AnyIterator { () -> TestData in
            defer { i += 1 }
            return TestData(bool: i % 3 != 0)
        }
        XCTAssertFalse(data.and(\.bool))
    }
    
}
