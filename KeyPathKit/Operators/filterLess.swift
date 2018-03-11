//
//  filterLess.swift
//  KeyPathKit
//
//  Created by Vincent on 11/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func filter<T: Comparable>(where attribute: KeyPath<Element, T>, lessThan treshold: T) -> [Element] {
        return filter { $0[keyPath: attribute] < treshold }
    }
    
    public func filter<T: Comparable>(where attribute: KeyPath<Element, T>, lessOrEqual treshold: T) -> [Element] {
        return filter { $0[keyPath: attribute] <= treshold }
    }
}
