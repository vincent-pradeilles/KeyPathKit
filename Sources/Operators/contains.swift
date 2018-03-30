//
//  contains.swift
//  KeyPathKit
//
//  Created by Vincent on 30/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func contains(where attribute: KeyPath<Element, Bool>) -> Bool {
        return contains(where: { $0[keyPath: attribute] })
    }
}
