//
//  and.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func and(_ attribute: KeyPath<Element, Bool>) -> Bool {
        return reduce(true) { $0 && $1[keyPath: attribute] }
    }
}
