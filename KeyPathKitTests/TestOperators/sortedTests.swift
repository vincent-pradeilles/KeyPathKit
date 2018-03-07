//
//  sortedTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct TestData {
    var firstName: String
    var lastName: String
}

extension TestData: Equatable {
    static func == (lhs: TestData, rhs: TestData) -> Bool {
        return lhs.firstName == rhs.firstName
            && lhs.lastName == rhs.lastName
    }
}

class SortedTests: XCTestCase {
    
    func test_sorted_empty() {
        let data: [TestData] = []
        
        XCTAssertEqual(data.sorted(by: \.firstName), [])
        XCTAssertEqual(data.sorted(by: \.lastName), [])
    }
    
    func test_sorted_values() {
        let data = [TestData(firstName: "Charlie", lastName: "Webb"),
                    TestData(firstName: "Alex", lastName: "Elexson"),
                    TestData(firstName: "Charles", lastName: "Webb"),
                    TestData(firstName: "Alex", lastName: "Zunino"),
                    TestData(firstName: "Alex", lastName: "Alexson"),
                    TestData(firstName: "John", lastName: "Webb")]
        
        let expectedFirstName = [TestData(firstName: "Alex", lastName: "Elexson"),
                                 TestData(firstName: "Alex", lastName: "Zunino"),
                                 TestData(firstName: "Alex", lastName: "Alexson"),
                                 TestData(firstName: "Charles", lastName: "Webb"),
                                 TestData(firstName: "Charlie", lastName: "Webb"),
                                 TestData(firstName: "John", lastName: "Webb")]
        
        let expectedLastName = [TestData(firstName: "Alex", lastName: "Alexson"),
                                TestData(firstName: "Alex", lastName: "Elexson"),
                                TestData(firstName: "Charlie", lastName: "Webb"),
                                TestData(firstName: "Charles", lastName: "Webb"),
                                TestData(firstName: "John", lastName: "Webb"),
                                TestData(firstName: "Alex", lastName: "Zunino")]
        
        XCTAssertEqual(data.sorted(by: \.firstName), expectedFirstName)
        XCTAssertEqual(data.sorted(by: \.lastName), expectedLastName)
    }
}
