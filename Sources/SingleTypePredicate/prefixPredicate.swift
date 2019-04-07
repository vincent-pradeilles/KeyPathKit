//
//  prefixPredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 31/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func prefix(while predicate: KeyPathSingleTypePredicate<Element>) -> [Self.Element] {
        return prefix(while: { predicate.evaluate(for: $0) })
    }
}
