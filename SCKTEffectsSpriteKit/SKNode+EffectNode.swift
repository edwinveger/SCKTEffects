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
    
    public var scale: CGPoint {
        get {
            return CGPoint(x: xScale, y: yScale)
        }
        set {
            xScale = newValue.x
            yScale = newValue.y
        }
    }
    
    public var rotation: CGFloat {
        get {
            return zRotation
        }
        set {
            zRotation = newValue
        }
    }
}

extension SKTEffect where T == SKNode {
    
    public func asAction() -> SKAction {
        return SKAction.action(with: self)
    }
}

/// Wrapper that allows you to use SKTEffect objects as regular SKActions.
public extension SKAction {
    
    public class func action(with effect: SKTEffect<SKNode>) -> SKAction {
        return SKAction.customAction(withDuration: effect.duration) { node, elapsedTime in
            var t = elapsedTime / CGFloat(effect.duration)
            t = effect.timingFunction?(t) ?? t // the magic happens here
            effect.update(t)
        }
    }
}
