//
//  sorted.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

public struct Sort<Element> {
    public private(set) var compare: (Element, Element) -> ComparisonResult

    public static func ascending<T: Comparable>(_ attribute: KeyPath<Element, T>) -> Sort<Element> {
        return Sort(compare: { lhs, rhs -> ComparisonResult in
            let (x, y) = (lhs[keyPath: attribute], rhs[keyPath: attribute])
            
            if x == y {
                return .orderedSame
            } else if x < y {
                return .orderedAscending
            } else {
                return .orderedDescending
            }
        })
    }
    
    public static func descending<T: Comparable>(_ attribute: KeyPath<Element, T>) -> Sort<Element> {
        return Sort(compare: { lhs, rhs -> ComparisonResult in
            let (x, y) = (lhs[keyPath: attribute], rhs[keyPath: attribute])
            
            if x == y {
                return .orderedSame
            } else if x < y {
                return .orderedDescending
            } else {
                return .orderedAscending
            }
        })
    }
}

extension Sequence {
    public func sorted<T: Comparable>(by attribute: KeyPath<Element, T>) -> [Element] {
        return sorted(by: { (elm1, elm2) -> Bool in
            return elm1[keyPath: attribute] < elm2[keyPath: attribute]
        })
    }
    
    public func sorted(by sortCriteria: Sort<Element>...) -> [Element] {
        return sorted(by: { (elm1, elm2) -> Bool in
            for sortCriterion in sortCriteria {
                switch sortCriterion.compare(elm1, elm2) {
                case .orderedSame:
                    break
                case .orderedAscending:
                    return true
                case .orderedDescending:
                    return false
                }
            }
            
            return false
        })
    }
}
