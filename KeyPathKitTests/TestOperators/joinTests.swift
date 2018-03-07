//
//  joinTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string1: String
    let string2: String
}

extension TestData: Equatable {
    static func == (lhs: TestData, rhs: TestData) -> Bool {
        return lhs.string1 == rhs.string1
            && lhs.string2 == rhs.string2
    }
}

private func == (lhs: (TestData, TestData), rhs: (TestData, TestData)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1
}

private func == (lhs: [(TestData, TestData)], rhs: [(TestData, TestData)]) -> Bool {
    return zip(lhs, rhs).reduce(true, { (previous, elem) -> Bool in
        return previous && (elem.0 == elem.1)
    })
}

class JoinTests: XCTestCase {
    
    func test_join_empty() {
        let left: [TestData] = []
        let right = [TestData(string1: "one", string2: "two"),
                     TestData(string1: "three", string2: "one"),
                     TestData(string1: "two", string2: "first"),
                     TestData(string1: "two", string2: "five"),
                     TestData(string1: "four", string2: "six")]
        
        let expected = [] as [(TestData, TestData)]
        
        XCTAssert(left.join(\.string1, with: left, on: \.string2) == expected)
        XCTAssert(left.join(\.string1, with: right, on: \.string2) == expected)
    }
    
    func test_join_values() {
        let data = [TestData(string1: "one", string2: "two"),
                     TestData(string1: "three", string2: "one"),
                     TestData(string1: "two", string2: "first"),
                     TestData(string1: "two", string2: "five"),
                     TestData(string1: "four", string2: "six")]
        
        let expected = [(TestData(string1: "one", string2: "two"), TestData(string1: "three", string2: "one")),
                        (TestData(string1: "two", string2: "first"), TestData(string1: "one", string2: "two")),
                        (TestData(string1: "two", string2: "five"), TestData(string1: "one", string2: "two"))]
        
        XCTAssert(data.join(\.string1, with: data, on: \.string2) == expected)
    }
}
