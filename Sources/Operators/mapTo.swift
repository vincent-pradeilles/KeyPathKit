//
//  mapTo.swift
//  KeyPathKit
//
//  Created by Vincent on 06/04/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import Foundation

extension Sequence {
    public func map<A, Result>(_ attribute1: KeyPath<Element, A>,
                               to function: (A) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1]) }
    }
    
    public func map<A, B, Result>(_ attribute1: KeyPath<Element, A>,
                                  _ attribute2: KeyPath<Element, B>,
                                  to function: (A, B) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2]) }
    }
    
    public func map<A, B, C, Result>(_ attribute1: KeyPath<Element, A>,
                                     _ attribute2: KeyPath<Element, B>,
                                     _ attribute3: KeyPath<Element, C>,
                                     to function: (A, B, C) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3]) }
    }
    
    public func map<A, B, C, D, Result>(_ attribute1: KeyPath<Element, A>,
                                        _ attribute2: KeyPath<Element, B>,
                                        _ attribute3: KeyPath<Element, C>,
                                        _ attribute4: KeyPath<Element, D>,
                                        to function: (A, B, C, D) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4]) }
    }
    
    public func map<A, B, C, D, E, Result>(_ attribute1: KeyPath<Element, A>,
                                           _ attribute2: KeyPath<Element, B>,
                                           _ attribute3: KeyPath<Element, C>,
                                           _ attribute4: KeyPath<Element, D>,
                                           _ attribute5: KeyPath<Element, E>,
                                           to function: (A, B, C, D, E) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5]) }
    }
    
    public func map<A, B, C, D, E, F, Result>(_ attribute1: KeyPath<Element, A>,
                                              _ attribute2: KeyPath<Element, B>,
                                              _ attribute3: KeyPath<Element, C>,
                                              _ attribute4: KeyPath<Element, D>,
                                              _ attribute5: KeyPath<Element, E>,
                                              _ attribute6: KeyPath<Element, F>,
                                              to function: (A, B, C, D, E, F) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6]) }
    }
    
    public func map<A, B, C, D, E, F, G, Result>(_ attribute1: KeyPath<Element, A>,
                                                 _ attribute2: KeyPath<Element, B>,
                                                 _ attribute3: KeyPath<Element, C>,
                                                 _ attribute4: KeyPath<Element, D>,
                                                 _ attribute5: KeyPath<Element, E>,
                                                 _ attribute6: KeyPath<Element, F>,
                                                 _ attribute7: KeyPath<Element, G>,
                                                 to function: (A, B, C, D, E, F, G) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, Result>(_ attribute1: KeyPath<Element, A>,
                                                    _ attribute2: KeyPath<Element, B>,
                                                    _ attribute3: KeyPath<Element, C>,
                                                    _ attribute4: KeyPath<Element, D>,
                                                    _ attribute5: KeyPath<Element, E>,
                                                    _ attribute6: KeyPath<Element, F>,
                                                    _ attribute7: KeyPath<Element, G>,
                                                    _ attribute8: KeyPath<Element, H>,
                                                    to function: (A, B, C, D, E, F, G, H) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, Result>(_ attribute1: KeyPath<Element, A>,
                                                       _ attribute2: KeyPath<Element, B>,
                                                       _ attribute3: KeyPath<Element, C>,
                                                       _ attribute4: KeyPath<Element, D>,
                                                       _ attribute5: KeyPath<Element, E>,
                                                       _ attribute6: KeyPath<Element, F>,
                                                       _ attribute7: KeyPath<Element, G>,
                                                       _ attribute8: KeyPath<Element, H>,
                                                       _ attribute9: KeyPath<Element, I>,
                                                       to function: (A, B, C, D, E, F, G, H, I) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, K, Result>(_ attribute1: KeyPath<Element, A>,
                                                          _ attribute2: KeyPath<Element, B>,
                                                          _ attribute3: KeyPath<Element, C>,
                                                          _ attribute4: KeyPath<Element, D>,
                                                          _ attribute5: KeyPath<Element, E>,
                                                          _ attribute6: KeyPath<Element, F>,
                                                          _ attribute7: KeyPath<Element, G>,
                                                          _ attribute8: KeyPath<Element, H>,
                                                          _ attribute9: KeyPath<Element, I>,
                                                          _ attribute10: KeyPath<Element, K>,
                                                          to function: (A, B, C, D, E, F, G, H, I, K) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9],
                              $0[keyPath: attribute10]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, K, L, Result>(_ attribute1: KeyPath<Element, A>,
                                                             _ attribute2: KeyPath<Element, B>,
                                                             _ attribute3: KeyPath<Element, C>,
                                                             _ attribute4: KeyPath<Element, D>,
                                                             _ attribute5: KeyPath<Element, E>,
                                                             _ attribute6: KeyPath<Element, F>,
                                                             _ attribute7: KeyPath<Element, G>,
                                                             _ attribute8: KeyPath<Element, H>,
                                                             _ attribute9: KeyPath<Element, I>,
                                                             _ attribute10: KeyPath<Element, K>,
                                                             _ attribute11: KeyPath<Element, L>,
                                                             to function: (A, B, C, D, E, F, G, H, I, K, L) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9],
                              $0[keyPath: attribute10],
                              $0[keyPath: attribute11]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, K, L, M, Result>(_ attribute1: KeyPath<Element, A>,
                                                                _ attribute2: KeyPath<Element, B>,
                                                                _ attribute3: KeyPath<Element, C>,
                                                                _ attribute4: KeyPath<Element, D>,
                                                                _ attribute5: KeyPath<Element, E>,
                                                                _ attribute6: KeyPath<Element, F>,
                                                                _ attribute7: KeyPath<Element, G>,
                                                                _ attribute8: KeyPath<Element, H>,
                                                                _ attribute9: KeyPath<Element, I>,
                                                                _ attribute10: KeyPath<Element, K>,
                                                                _ attribute11: KeyPath<Element, L>,
                                                                _ attribute12: KeyPath<Element, M>,
                                                                to function: (A, B, C, D, E, F, G, H, I, K, L, M) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9],
                              $0[keyPath: attribute10],
                              $0[keyPath: attribute11],
                              $0[keyPath: attribute12]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, K, L, M, N, Result>(_ attribute1: KeyPath<Element, A>,
                                                                   _ attribute2: KeyPath<Element, B>,
                                                                   _ attribute3: KeyPath<Element, C>,
                                                                   _ attribute4: KeyPath<Element, D>,
                                                                   _ attribute5: KeyPath<Element, E>,
                                                                   _ attribute6: KeyPath<Element, F>,
                                                                   _ attribute7: KeyPath<Element, G>,
                                                                   _ attribute8: KeyPath<Element, H>,
                                                                   _ attribute9: KeyPath<Element, I>,
                                                                   _ attribute10: KeyPath<Element, K>,
                                                                   _ attribute11: KeyPath<Element, L>,
                                                                   _ attribute12: KeyPath<Element, M>,
                                                                   _ attribute13: KeyPath<Element, N>,
                                                                   to function: (A, B, C, D, E, F, G, H, I, K, L, M, N) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9],
                              $0[keyPath: attribute10],
                              $0[keyPath: attribute11],
                              $0[keyPath: attribute12],
                              $0[keyPath: attribute13]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, K, L, M, N, O, Result>(_ attribute1: KeyPath<Element, A>,
                                                                      _ attribute2: KeyPath<Element, B>,
                                                                      _ attribute3: KeyPath<Element, C>,
                                                                      _ attribute4: KeyPath<Element, D>,
                                                                      _ attribute5: KeyPath<Element, E>,
                                                                      _ attribute6: KeyPath<Element, F>,
                                                                      _ attribute7: KeyPath<Element, G>,
                                                                      _ attribute8: KeyPath<Element, H>,
                                                                      _ attribute9: KeyPath<Element, I>,
                                                                      _ attribute10: KeyPath<Element, K>,
                                                                      _ attribute11: KeyPath<Element, L>,
                                                                      _ attribute12: KeyPath<Element, M>,
                                                                      _ attribute13: KeyPath<Element, N>,
                                                                      _ attribute14: KeyPath<Element, O>,
                                                                      to function: (A, B, C, D, E, F, G, H, I, K, L, M, N, O) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9],
                              $0[keyPath: attribute10],
                              $0[keyPath: attribute11],
                              $0[keyPath: attribute12],
                              $0[keyPath: attribute13],
                              $0[keyPath: attribute14]) }
    }
    
    public func map<A, B, C, D, E, F, G, H, I, K, L, M, N, O, P, Result>(_ attribute1: KeyPath<Element, A>,
                                                                         _ attribute2: KeyPath<Element, B>,
                                                                         _ attribute3: KeyPath<Element, C>,
                                                                         _ attribute4: KeyPath<Element, D>,
                                                                         _ attribute5: KeyPath<Element, E>,
                                                                         _ attribute6: KeyPath<Element, F>,
                                                                         _ attribute7: KeyPath<Element, G>,
                                                                         _ attribute8: KeyPath<Element, H>,
                                                                         _ attribute9: KeyPath<Element, I>,
                                                                         _ attribute10: KeyPath<Element, K>,
                                                                         _ attribute11: KeyPath<Element, L>,
                                                                         _ attribute12: KeyPath<Element, M>,
                                                                         _ attribute13: KeyPath<Element, N>,
                                                                         _ attribute14: KeyPath<Element, O>,
                                                                         _ attribute15: KeyPath<Element, P>,
                                                                         to function: (A, B, C, D, E, F, G, H, I, K, L, M, N, O, P) -> Result) -> [Result] {
        return map { function($0[keyPath: attribute1],
                              $0[keyPath: attribute2],
                              $0[keyPath: attribute3],
                              $0[keyPath: attribute4],
                              $0[keyPath: attribute5],
                              $0[keyPath: attribute6],
                              $0[keyPath: attribute7],
                              $0[keyPath: attribute8],
                              $0[keyPath: attribute9],
                              $0[keyPath: attribute10],
                              $0[keyPath: attribute11],
                              $0[keyPath: attribute12],
                              $0[keyPath: attribute13],
                              $0[keyPath: attribute14],
                              $0[keyPath: attribute15]) }
    }
}
