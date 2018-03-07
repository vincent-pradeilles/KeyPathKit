//
//  flatMap.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func flatMap<T>(_ attribute: KeyPath<Element, [T]>) -> [T] {
        return flatMap { $0[keyPath: attribute] }
    }

}
