//
//  SKNode+EffectNode.swift
//  SCKTEffects
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SCKTEffectsCore
import SpriteKit

extension SKNode: EffectNode {
    
    public typealias Position = CGPoint
    public typealias Rotation = CGFloat
    public typealias Scale = CGPoint
    
    public var sckt_position: CGPoint {
        get { return position }
        set { position = newValue }
    }
    
    public var sckt_rotation: CGFloat {
        get { return zRotation }
        set { zRotation = newValue }
    }
    
    public var sckt_scale: CGPoint {
        get {
            return CGPoint(x: xScale, y: yScale)
        }
        set {
            xScale = newValue.x
            yScale = newValue.y
        }
    }
}

extension SKTEffect where Node: SKNode {
    
    public func asAction() -> SKAction {
        return SKAction.action(with: self)
    }
}

/// Wrapper that allows you to use SKTEffect objects as regular SKActions.
public extension SKAction {
    
    public class func action<E: SKTEffect>(with effect: E) -> SKAction {
        return SKAction.customAction(withDuration: effect.duration) { node, elapsedTime in
            var t = elapsedTime / CGFloat(effect.duration)
            t = effect.timingFunction(t) // the magic happens here
            effect.update(t)
            
            if t == 1.0 {
                effect.started = false
            }
        }
    }
}
