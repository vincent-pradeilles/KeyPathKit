//
//  min.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Collection {
    public func min<T: Comparable>(by attribute: KeyPath<Element, T>) -> Element? {
        return self.min(by: { $0[keyPath: attribute] < $1[keyPath: attribute] })
    }

    public func min<T: Comparable>(_ attribute: KeyPath<Element, T>) -> T? {
        return self.min(by: attribute)?[keyPath: attribute]
    }
}
