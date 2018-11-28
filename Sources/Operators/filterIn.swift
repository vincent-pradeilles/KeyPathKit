//
//  filterIn.swift
//  KeyPathKit
//
//  Created by Vincent on 11/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func filter<S: Sequence, T: Equatable>(where attribute: KeyPath<Element, T>, in values: S) -> [Element] where S.Element == T {
        return filter { values.contains($0[keyPath: attribute]) }
    }

    public func filter<S: Sequence, T: Equatable>(where values: S, contains attribute: KeyPath<Element, T>) -> [Element] where S.Element == T {
        return filter { values.contains($0[keyPath: attribute]) }
    }
}
