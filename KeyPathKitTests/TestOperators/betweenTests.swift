//
//  betweenTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    let int: Int
    let char: Character
}

extension TestData: Equatable {
    static func == (lhs: TestData, rhs: TestData) -> Bool {
        return lhs.int == rhs.int
            && lhs.char == rhs.char
    }
    
    
}

class BetweenTests: XCTestCase {
    
    func test_between_empty() {
        let data: [TestData] = []
        
        XCTAssertEqual(data.between(\.int, range: 0...10), [])
        XCTAssertEqual(data.between(\.int, range: 0..<10), [])
        XCTAssertEqual(data.between(\.char, range: "a"..."g"), [])
    }
    
    func test_between_values() {
        let data = [TestData(int: 4, char: "a"),
                    TestData(int: 15, char: "z"),
                    TestData(int: -4, char: "v"),
                    TestData(int: 10, char: "e"),
                    TestData(int: 21, char: "i"),
                    TestData(int: 6, char: "a")]
        
        XCTAssertEqual(data.between(\.int, range: 0...10), [TestData(int: 4, char: "a"), TestData(int: 10, char: "e"),TestData(int: 6, char: "a")])
        XCTAssertEqual(data.between(\.int, range: 0..<10), [TestData(int: 4, char: "a"),TestData(int: 6, char: "a")])
        XCTAssertEqual(data.between(\.char, range: "a"..."g"), [TestData(int: 4, char: "a"), TestData(int: 10, char: "e"), TestData(int: 6, char: "a")])
    }
}
