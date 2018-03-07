//
//  between.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func between<T> (_ attribute: KeyPath<Element, T>, range: Range<T>) -> [Element] {
        return filter { range.contains($0[keyPath: attribute]) }
    }
    
    public func between<T> (_ attribute: KeyPath<Element, T>, range: ClosedRange<T>) -> [Element] {
        return filter { range.contains($0[keyPath: attribute]) }
    }
}
