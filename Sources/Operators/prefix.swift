//
//  prefix.swift
//  KeyPathKit
//
//  Created by Vincent on 31/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func prefix(while attribute: KeyPath<Element, Bool>) -> [Self.Element] {
        return prefix(while: { $0[keyPath: attribute] })
    }
}
