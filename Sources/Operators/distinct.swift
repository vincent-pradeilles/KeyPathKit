//
//  distinct.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func distinct<T: Equatable>(_ attribute: KeyPath<Element, T>) -> [T] {
        var result: [T] = []
        
        for value in self {
            if !result.contains(value[keyPath: attribute]) {
                result.append(value[keyPath: attribute])
            }
        }
        
        return result
    }
}
