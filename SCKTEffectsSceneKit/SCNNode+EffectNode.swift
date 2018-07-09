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
}

extension SKTEffect where T == SCNNode {
    
    public func asAction() -> SCNAction {
        return SCNAction.action(with: self)
    }
}

/// Wrapper that allows you to use SKTEffect objects as regular SCNActions.
public extension SCNAction {
    
    public class func action(with effect: SKTEffect<SCNNode>) -> SCNAction {
        return SCNAction.customAction(duration: effect.duration) { node, elapsedTime in
            var t = elapsedTime / CGFloat(effect.duration)
            t = effect.timingFunction?(t) ?? t // the magic happens here
            effect.update(t)
        }
    }
}
