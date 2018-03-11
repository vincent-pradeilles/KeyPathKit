//
//  filterLikeTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 11/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string: String
}

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.string == rhs.string
    }
}

class FilterLikeTests: XCTestCase {
    
    func test_filterLike_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.filter(where: \.string, like: "").isEmpty)
    }
    
    func test_filterLike_allValues() {
        let data: [TestData] = [TestData(string: "second"),
                                TestData(string: "third")]
        
        XCTAssertEqual(data.filter(where: \.string, like: "^[a-z]*d$"), data)
    }
    
    func test_filterLike_someValues() {
        let data: [TestData] = [TestData(string: "first"),
                                TestData(string: "second"),
                                TestData(string: "third")]
        
        XCTAssertEqual(data.filter(where: \.string, like: "^[a-z]*d$"), [TestData(string: "second"), TestData(string: "third")])
    }
    
    func test_filterLike_noValue() {
        let data: [TestData] = [TestData(string: "first"),
                                TestData(string: "second"),
                                TestData(string: "third")]
        
        XCTAssertEqual(data.filter(where: \.string, like: "^a*$"), [])
    }
}

