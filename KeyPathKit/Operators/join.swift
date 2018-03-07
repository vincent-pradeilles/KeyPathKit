//
//  join.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

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
}
