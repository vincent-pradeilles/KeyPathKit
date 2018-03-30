//
//  dropPredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 30/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func drop(while predicate: KeyPathSingleTypePredicate<Element>) -> Self.SubSequence {
        return drop(while: { predicate.evaluate(for: $0) })
    }
}
