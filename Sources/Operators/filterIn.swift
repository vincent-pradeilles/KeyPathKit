//
//  filterIn.swift
//  KeyPathKit
//
//  Created by Vincent on 11/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func filter<T>(where attribute: KeyPath<Element, T>, in values: Set<T>) -> [Element] {
        return filter { values.contains($0[keyPath: attribute]) }
    }

    public func filter<T>(where values: Set<T>, contains attribute: KeyPath<Element, T>) -> [Element] {
        return filter { values.contains($0[keyPath: attribute]) }
    }
}
