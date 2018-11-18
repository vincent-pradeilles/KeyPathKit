//
//  max.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Collection {
    public func max<T: Comparable>(by attribute: KeyPath<Element, T>) -> Element? {
        return self.max(by: { $0[keyPath: attribute] < $1[keyPath: attribute] })
    }
}
