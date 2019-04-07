//
//  groupByTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string: String
    let int: Int
    let bool: Bool
}

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.string == rhs.string
            && lhs.int == rhs.int
            && lhs.bool == rhs.bool
    }
}

private func == (_ lhs: [String: [TestData]], _ rhs: [String: [TestData]]) -> Bool {
    return zip(lhs, rhs).reduce(true) { (previous, elem) -> Bool in
        return previous && ((elem.0.key == elem.1.key) && (elem.0.value == elem.1.value))
    }
}

class GroupByTests: XCTestCase {
    
    func test_groupBy() {
        let data = [TestData(string: "one", int: 2, bool: true),
                    TestData(string: "two", int: 45, bool: false),
                    TestData(string: "one", int: 32, bool: true),
                    TestData(string: "two", int: 19, bool: false),
                    TestData(string: "three", int: 78, bool: false),
                    TestData(string: "one", int: -6, bool: true)]
        
        let expected = ["one": [TestData(string: "one", int: 2, bool: true),
                                TestData(string: "one", int: 32, bool: true),
                                TestData(string: "one", int: -6, bool: true)],
                        
                        "two": [TestData(string: "two", int: 45, bool: false),
                                TestData(string: "two", int: 19, bool: false)],
                        
                        "three": [TestData(string: "three", int: 78, bool: false)]]
        
        // In dictionnary sorting doesn't matter.
        data.groupBy(\.string).forEach { (key, value) in
            
            XCTAssert(expected[key] == value)
        }
    }
}
