//
//  SCNNode+EffectNode.swift
//  SCKTEffects
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SceneKit
import SCKTEffectsCore

extension SCNNode: EffectNode {
    public typealias Position = SCNVector3
    public typealias Rotation = SCNVector4
    public typealias Scale = SCNVector3
    
    public var sckt_position: Position {
        get { return position }
        set { position = newValue }
    }
    
    public var sckt_rotation: Rotation {
        get { return rotation }
        set { rotation = newValue }
    }
    
    public var sckt_scale: Scale {
        get { return scale }
        set { scale = newValue }
    }
}

extension SKTEffect where Node: SCNNode {
    
    public func asAction() -> SCNAction {
        return SCNAction.action(with: self)
    }
}

/// Wrapper that allows you to use SKTEffect objects as regular SCNActions.
public extension SCNAction {
    
    public class func action<E: SKTEffect>(with effect: E) -> SCNAction {
        return SCNAction.customAction(duration: effect.duration) { node, elapsedTime in
            var t = elapsedTime / CGFloat(effect.duration)
            t = effect.timingFunction(t) // the magic happens here
            effect.update(t)
            
            if t == 1.0 {
                effect.started = false
            }
        }
    }
}
