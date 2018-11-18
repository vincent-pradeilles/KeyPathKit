//
//  filterInTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 11/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let string: String
    let int: Int
}

extension TestData: Equatable {
    static func == (_ lhs: TestData, _ rhs: TestData) -> Bool {
        return lhs.string == rhs.string
            && lhs.int == rhs.int
    }
}

class FilterInTests: XCTestCase {
    
    func test_filterIn_empty() {
        let data: [TestData] = []
        
        XCTAssertTrue(data.filter(where: \.string, in: ["first"]).isEmpty)
        XCTAssertTrue(data.filter(where: \.int, in: [2, 4]).isEmpty)

        XCTAssertTrue(data.filter(where: ["first"], contains: \.string).isEmpty)
        XCTAssertTrue(data.filter(where: [2, 4], contains: \.int).isEmpty)
    }
    
    func test_filterIn_allValues() {
        let data: [TestData] = [TestData(string: "first", int: 2),
                                TestData(string: "second", int: 78),
                                TestData(string: "third", int: -22)]

        XCTAssertEqual(data.filter(where: \.string, in: ["first", "second", "third"]), data)
        XCTAssertEqual(data.filter(where: \.int, in: [2, 78, -22]), data)

        XCTAssertEqual(data.filter(where: ["first", "second", "third"], contains: \.string), data)
        XCTAssertEqual(data.filter(where: [2, 78, -22], contains: \.int), data)
    }
    
    func test_filterIn_someValues() {
        let data: [TestData] = [TestData(string: "first", int: 2),
                                TestData(string: "second", int: 78),
                                TestData(string: "third", int: -22)]

        XCTAssertEqual(data.filter(where: \.string, in: ["first", "third"]), [TestData(string: "first", int: 2), TestData(string: "third", int: -22)])
        XCTAssertEqual(data.filter(where: \.int, in: [78]), [TestData(string: "second", int: 78)])

        XCTAssertEqual(data.filter(where: ["first", "third"], contains: \.string), [TestData(string: "first", int: 2), TestData(string: "third", int: -22)])
        XCTAssertEqual(data.filter(where: [78], contains: \.int), [TestData(string: "second", int: 78)])
    }
    
    func test_filterIn_noValue() {
        let data: [TestData] = [TestData(string: "first", int: 2),
                                TestData(string: "second", int: 78),
                                TestData(string: "third", int: -22)]

        XCTAssertEqual(data.filter(where: \.string, in: ["fourth"]), [])
        XCTAssertEqual(data.filter(where: \.int, in: [3, 67, 90]), [])

        XCTAssertEqual(data.filter(where: ["fourth"], contains: \.string), [])
        XCTAssertEqual(data.filter(where: [3, 67, 90], contains: \.int), [])
    }
}
