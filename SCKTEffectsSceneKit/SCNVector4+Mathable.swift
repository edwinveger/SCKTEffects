//
//  SCNVector4+Mathable.swift
//  SCKTEffectsSceneKit
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SceneKit
import SCKTEffectsCore

extension SCNVector4: Mathable {
    
    public static func + (lhs: SCNVector4, rhs: SCNVector4) -> SCNVector4 {
        return SCNVector4(
            x: lhs.x + rhs.x,
            y: lhs.y + rhs.y,
            z: lhs.z + rhs.z,
            w: lhs.w + rhs.w
        )
    }
    
    public static func += (lhs: inout SCNVector4, rhs: SCNVector4) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: SCNVector4, rhs: SCNVector4) -> SCNVector4 {
        return SCNVector4(
            x: lhs.x - rhs.x,
            y: lhs.y - rhs.y,
            z: lhs.z - rhs.z,
            w: lhs.w - rhs.w
        )
    }
    
    public static func * (lhs: SCNVector4, factor: CGFloat) -> SCNVector4 {
        let factor = Float(factor)
        return SCNVector4(
            x: lhs.x * factor,
            y: lhs.y * factor,
            z: lhs.z * factor,
            w: lhs.w * factor
        )
    }
    
    public static func * (lhs: SCNVector4, rhs: SCNVector4) -> SCNVector4 {
        return SCNVector4(
            x: lhs.x * rhs.x,
            y: lhs.y * rhs.y,
            z: lhs.z * rhs.z,
            w: lhs.w * rhs.w
        )
    }
    
    public static func *= (lhs: inout SCNVector4, rhs: SCNVector4) {
        lhs = lhs * rhs
    }
    
    public static func / (lhs: SCNVector4, factor: CGFloat) -> SCNVector4 {
        let factor = Float(factor)
        return SCNVector4(
            x: lhs.x / factor,
            y: lhs.y / factor,
            z: lhs.z / factor,
            w: lhs.w / factor
        )
    }
    
    public static func / (lhs: SCNVector4, rhs: SCNVector4) -> SCNVector4 {
        return SCNVector4(
            x: lhs.x / rhs.x,
            y: lhs.y / rhs.y,
            z: lhs.z / rhs.z,
            w: lhs.w / rhs.w
        )
    }
}
