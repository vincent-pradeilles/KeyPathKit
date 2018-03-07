//
//  groupBy.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    func groupBy<T: Hashable>(_ groupAttribute: KeyPath<Element, T>) -> [T: [Element]] {
        var result: [T: [Element]] = [:]
        
        for value in self {
            let attribute = value[keyPath: groupAttribute]
            
            if result.keys.contains(attribute) {
                result[attribute]?.append(value)
            } else {
                result[attribute] = [value]
            }
        }
        
        return result
    }
}
