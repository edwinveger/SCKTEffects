//
//  EffectNode.swift
//  SCKTEffects
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SpriteKit

public protocol EffectNode: class {
    associatedtype Position: Mathable
    associatedtype Rotation: Mathable
    associatedtype Scale: Mathable
    
    var position: Position { get set }
    var rotation: Rotation { get set }
    var scale: Scale { get set }
}

/// Basic mathematic operations / manipulation.
public protocol Mathable {
    static func - (lhs: Self, rhs: Self) -> Self
    static func + (lhs: Self, rhs: Self) -> Self
    static func += (lhs: inout Self, rhs: Self)
    static func * (lhs: Self, factor: CGFloat) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func *= (lhs: inout Self, rhs: Self)
    static func / (lhs: Self, factor: CGFloat) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
}
