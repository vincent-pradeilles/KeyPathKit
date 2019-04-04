//
//  drop.swift
//  KeyPathKit
//
//  Created by Vincent on 30/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func drop(while attribute: KeyPath<Element, Bool>) -> DropWhileSequence<Self> {
        return drop(while: { $0[keyPath: attribute] })
    }
}
