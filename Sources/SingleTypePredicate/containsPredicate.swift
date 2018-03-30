//
//  containsPredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 30/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func contains(where predicate: KeyPathSingleTypePredicate<Element>) -> Bool {
        return contains(where: { predicate.evaluate(for: $0) })
    }
}
