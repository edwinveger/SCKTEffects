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
    
    var sckt_position: Position { get set }
    var sckt_rotation: Rotation { get set }
    var sckt_scale: Scale { get set }
}

public extension EffectNode {
    
    /// A convenience constructor for the move effect, supporting custom timing functions.
    ///
    /// - Returns: A scale effect.
    public static func moveEffect() -> SKTMoveEffect<Self> {
        return SKTMoveEffect<Self>()
    }

    /// A convenience constructor for the rotate effect, supporting custom timing functions.
    ///
    /// - Returns: A scale effect.
    public static func rotateEffect() -> SKTRotateEffect<Self> {
        return SKTRotateEffect<Self>()
    }
    
    /// A convenience constructor for the scale effect, supporting custom timing functions.
    ///
    /// - Returns: A scale effect.
    public static func scaleEffect() -> SKTScaleEffect<Self> {
        return SKTScaleEffect<Self>()
    }
}

/// Basic mathematic operations / manipulation.
public protocol Mathable {
    static var zero: Self { get }
    static func - (lhs: Self, rhs: Self) -> Self
    static func + (lhs: Self, rhs: Self) -> Self
    static func += (lhs: inout Self, rhs: Self)
    static func * (lhs: Self, factor: CGFloat) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func *= (lhs: inout Self, rhs: Self)
    static func / (lhs: Self, factor: CGFloat) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
}
