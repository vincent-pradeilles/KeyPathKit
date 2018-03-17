//
//  DoubleTypePredicate.swift
//  KeyPathKit
//
//  Created by Vincent on 12/03/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

public struct KeyPathDoubleTypePredicate<Element, OtherElement> {
    
    private let evaluator: (Element, OtherElement) -> Bool
    
    public init(evaluator: @escaping (Element, OtherElement) -> Bool) {
        self.evaluator = evaluator
    }
    
    public func evaluate(for leftElement: Element, and rightElement: OtherElement) -> Bool {
        return evaluator(leftElement, rightElement)
    }
}
