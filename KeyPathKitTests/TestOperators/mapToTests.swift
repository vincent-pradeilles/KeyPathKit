//
//  mapToTests.swift
//  KeyPathKitTests
//
//  Created by Vincent on 06/04/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import XCTest
import KeyPathKit

private struct SourceData {
    let string: String
    let int: Int
    let bool: Bool
}

private struct DestinationData {
    let string: String
    let int: Int
}

extension DestinationData: Equatable {
    static func == (_ lhs: DestinationData, _ rhs: DestinationData) -> Bool {
        return lhs.string == rhs.string
            && lhs.int == rhs.int
    }
}

class MapToTests: XCTestCase {
    
    func test_mapTo_empty() {
        let data: [SourceData] = []
        
        XCTAssertEqual(data.map(\.string, \.int, to: DestinationData.init), [])
    }
    
    func test_mapTo_values() {
        let data = [SourceData(string: "one", int: 10, bool: true),
                    SourceData(string: "two", int: 11, bool: false),
                    SourceData(string: "three", int: 12, bool: false)]
        
        let expected = [DestinationData(string: "one", int: 10), DestinationData(string: "two", int: 11), DestinationData(string: "three", int: 12)]
        
        XCTAssertEqual(data.map(\.string, \.int, to: DestinationData.init), expected)
    }
}
