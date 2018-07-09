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
