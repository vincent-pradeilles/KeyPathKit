//
//  KeyPathSingleTypePredicate+Operators.swift
//  KeyPathKit
//
//  Created by Vincent on 12/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

public func && <Element>(_ leftPredicate: KeyPathSingleTypePredicate<Element>, _ rightPredicate: KeyPathSingleTypePredicate<Element>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in leftPredicate.evaluate(for: lhs, and: rhs) && rightPredicate.evaluate(for: lhs, and: rhs) })
}

public func || <Element>(_ leftPredicate: KeyPathSingleTypePredicate<Element>, _ rightPredicate: KeyPathSingleTypePredicate<Element>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in leftPredicate.evaluate(for: lhs, and: rhs) || rightPredicate.evaluate(for: lhs, and: rhs) })
}

public prefix func ! <Element>(_ predicate: KeyPathSingleTypePredicate<Element>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in !predicate.evaluate(for: lhs) })
}

public prefix func ! <Element>(_ attribute: KeyPath<Element, Bool>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in !lhs[keyPath: attribute] })
}

public func == <Element, T: Equatable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] == rhs[keyPath: rightAttribute] })
}

public func == <Element, T: Equatable>(_ leftAttribute: KeyPath<Element, T>, _ constant: T) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in lhs[keyPath: leftAttribute] == constant })
}

public func == <Element, T: Equatable>(_ constant: T, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { _, rhs in constant == rhs[keyPath: rightAttribute] })
}

public func != <Element, T: Equatable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] != rhs[keyPath: rightAttribute] })
}

public func != <Element, T: Equatable>(_ leftAttribute: KeyPath<Element, T>, _ constant: T) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in lhs[keyPath: leftAttribute] != constant })
}

public func != <Element, T: Equatable>(_ constant: T, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { _, rhs in constant != rhs[keyPath: rightAttribute] })
}

public func ~= <Element, T> (_ pattern: Range<T>, _ leftAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { _, rhs in pattern ~= rhs[keyPath: leftAttribute] })
}

public func ~= <Element, T> (_ pattern: ClosedRange<T>, _ leftAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { _, rhs in pattern ~= rhs[keyPath: leftAttribute] })
}

public func ~= <Element>(_ lhs: KeyPathSingleTypePredicate<Element>, rhs: Element) -> Bool {
    return lhs.evaluate(for: rhs)
}

public func <= <Element, T: Comparable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] <= rhs[keyPath: rightAttribute] })
}

public func <= <Element, T: Comparable>(_ attribute: KeyPath<Element, T>, _ treshold: T) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in lhs[keyPath: attribute] <= treshold })
}

public func < <Element, T: Comparable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] < rhs[keyPath: rightAttribute] })
}

public func < <Element, T: Comparable>(_ attribute: KeyPath<Element, T>, _ treshold: T) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in lhs[keyPath: attribute] < treshold })
}

public func >= <Element, T: Comparable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] >= rhs[keyPath: rightAttribute] })
}

public func >= <Element, T: Comparable>(_ attribute: KeyPath<Element, T>, _ treshold: T) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in lhs[keyPath: attribute] >= treshold })
}

public func > <Element, T: Comparable>(_ leftAttribute: KeyPath<Element, T>, _ rightAttribute: KeyPath<Element, T>) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, rhs in lhs[keyPath: leftAttribute] > rhs[keyPath: rightAttribute] })
}

public func > <Element, T: Comparable>(_ attribute: KeyPath<Element, T>, _ treshold: T) -> KeyPathSingleTypePredicate<Element> {
    return KeyPathSingleTypePredicate(evaluator: { lhs, _ in lhs[keyPath: attribute] > treshold })
}
