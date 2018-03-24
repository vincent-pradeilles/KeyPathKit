//
//  firstPredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 24/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func first(where predicate: KeyPathSingleTypePredicate<Element>) -> Element? {
        return first(where: { predicate.evaluate(for: $0)} )
    }
}
