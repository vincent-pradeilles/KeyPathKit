//
//  or.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    func or(_ attribute: KeyPath<Element, Bool>) -> Bool {
        return reduce(false) { $0 || $1[keyPath: attribute] }
    }
}
