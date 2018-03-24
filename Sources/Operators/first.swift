//
//  first.swift
//  KeyPathKit
//
//  Created by Vincent on 24/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func first(where attribute: KeyPath<Element, Bool>) -> Element? {
        return first(where: { $0[keyPath: attribute] })
    }
}
