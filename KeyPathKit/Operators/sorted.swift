//
//  sorted.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    func sorted<T: Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {
        return sorted(by: { (elm1, elm2) -> Bool in
            if elm1[keyPath: attribute] != elm2[keyPath: attribute] {
                return elm1[keyPath: attribute] < elm2[keyPath: attribute]
            }
            
            return false
        })
    }
}
