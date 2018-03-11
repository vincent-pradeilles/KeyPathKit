//
//  join.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

public struct Join<Element, OtherElement> {
    public private(set) var test: (Element, OtherElement) -> Bool
    
    public static func `where`<T: Equatable>(_ left: KeyPath<Element, T>, equals right: KeyPath<OtherElement, T>) -> Join<Element, OtherElement> {
        return Join(test: { lhs, rhs -> Bool in
            return lhs[keyPath: left] == rhs[keyPath: right]
        })
    }
}

extension Sequence {
    public func join<T: Equatable, OtherElement>(_ leftAttribute: KeyPath<Element, T>,
                                          with sequence: Array<OtherElement>,
                                          on rightAttribute: KeyPath<OtherElement, T>) -> [(Element, OtherElement)] {
        var result: [(Element, OtherElement)] = []
        
        for leftValue in self {
            for rightValue in sequence {
                if leftValue[keyPath: leftAttribute] == rightValue[keyPath: rightAttribute] {
                    result.append((leftValue, rightValue))
                }
            }
        }
        
        return result
    }
    
    public func join<OtherElement>(with sequence: Array<OtherElement>,
                                   _ attributes: Join<Element, OtherElement>...) -> [(Element, OtherElement)] {
        var result: [(Element, OtherElement)] = []
        
        for leftValue in self {
            for rightValue in sequence {
                if attributes.reduce(true, { $0 && $1.test(leftValue, rightValue) }) {
                    result.append((leftValue, rightValue))
                }
            }
        }
        
        return result
    }
}
