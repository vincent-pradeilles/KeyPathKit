//
//  average.swift
//  KeyPathKit
//
//  Created by Vincent on 07/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Array {
    public func average(_ attribute: KeyPath<Element, Int>) -> Double {
        return Double(sum(attribute)) / Double(count)
    }
    
    public func average(_ attribute: KeyPath<Element, Float>) -> Double {
        return Double(sum(attribute)) / Double(count)
    }
    
    public func average(_ attribute: KeyPath<Element, Double>) -> Double {
        return sum(attribute) / Double(count)
    }
}
