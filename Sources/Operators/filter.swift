//
//  filter.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func filter(where attributes: KeyPath<Element, Bool>...) -> [Element] {
        return filter { element in attributes.reduce(true) { previous, attribute in previous && element[keyPath: attribute] }  }
    }
}
