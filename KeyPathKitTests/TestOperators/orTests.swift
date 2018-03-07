//
//  orTests.swift
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

class OrTests: XCTestCase {
    
    func test_or_empty() {
        let data: [TestData] = []
        
        XCTAssertFalse(data.or(\.bool))
    }
    
    func test_or_allTrue() {
        let data = [TestData(bool: true), TestData(bool: true), TestData(bool: true)]
        
        XCTAssertTrue(data.or(\.bool))
    }
    
    func test_or_allFalse() {
        let data = [TestData(bool: false), TestData(bool: false), TestData(bool: false)]
        
        XCTAssertFalse(data.or(\.bool))
    }
    
    func test_or_mixed() {
        let data = [TestData(bool: true), TestData(bool: false), TestData(bool: true)]
        
        XCTAssertTrue(data.or(\.bool))
    }
}
