//
//  filterPredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 12/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func filter(where predicate: KeyPathSingleTypePredicate<Element>) -> [Element] {
        return filter { predicate.evaluate(for: $0) }
    }
}
