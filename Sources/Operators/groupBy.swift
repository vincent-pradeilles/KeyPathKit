//
//  groupBy.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func groupBy<T: Hashable>(_ groupAttribute: KeyPath<Element, T>) -> [T: [Element]] {
        var result: [T: [Element]] = [:]
        
        for value in self {
            let key = value[keyPath: groupAttribute]
            result[key, default: []].append(value)
        }
        
        return result
    }
}
