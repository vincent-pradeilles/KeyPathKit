//
//  DoubleTypePredicate+Operators.swift
//  KeyPathKit
//
//  Created by Vincent on 12/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

public func == <Element, OtherElement, T: Equatable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<OtherElement, T>) -> KeyPathDoubleTypePredicate<Element, OtherElement> {
    return KeyPathDoubleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] == rhs[keyPath: rightAttribute] })
}
