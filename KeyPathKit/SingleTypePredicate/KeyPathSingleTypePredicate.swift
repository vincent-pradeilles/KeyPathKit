//
//  KeyPathSingleTypePredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 12/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

public struct KeyPathSingleTypePredicate<Element> {
    
    private let evaluator: (Element, Element) -> Bool
    
    public init(evaluator: @escaping (Element, Element) -> Bool) {
        self.evaluator = evaluator
    }
    
    public func evaluate(for element: Element) -> Bool {
        return evaluator(element, element)
    }
    
    public func evaluate(for leftElement: Element, and rightElement: Element) -> Bool {
        return evaluator(leftElement, rightElement)
    }
}
