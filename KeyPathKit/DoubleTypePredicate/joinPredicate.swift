//
//  joinPredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 12/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Join {
    fileprivate static func `where`(_ predicate: KeyPathDoubleTypePredicate<Element, OtherElement>) -> Join<Element, OtherElement> {
        return Join(test: { lhs, rhs -> Bool in
            return predicate.evaluate(for: lhs, and: rhs)
        })
    }
}
extension Sequence {
    public func join<OtherElement>(with sequence: Array<OtherElement>,
                                   where predicates: KeyPathDoubleTypePredicate<Element, OtherElement>...) -> [(Element, OtherElement)] {        
        return join(with: sequence, predicates.map { Join.where($0) })
    }
}
