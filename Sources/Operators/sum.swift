//
//  sum.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func sum<T: Numeric>(of attribute: KeyPath<Element, T>) -> T {
        return reduce(0) { $0 + $1[keyPath: attribute] }
    }
}
