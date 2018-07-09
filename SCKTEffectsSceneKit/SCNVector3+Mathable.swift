//
//  SCNVector3+Mathable.swift
//  SCKTEffectsCore
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SceneKit
import SCKTEffectsCore

extension SCNVector3: Mathable {
    
    public static func + (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(
            x: lhs.x + rhs.x,
            y: lhs.y + rhs.y,
            z: lhs.z + rhs.z
        )
    }
    
    public static func += (lhs: inout SCNVector3, rhs: SCNVector3) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(
            x: lhs.x - rhs.x,
            y: lhs.y - rhs.y,
            z: lhs.z - rhs.z
        )
    }
    
    public static func * (lhs: SCNVector3, factor: CGFloat) -> SCNVector3 {
        let factor = Float(factor)
        return SCNVector3(
            x: lhs.x * factor,
            y: lhs.y * factor,
            z: lhs.z * factor
        )
    }
    
    public static func * (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(
            x: lhs.x * rhs.x,
            y: lhs.y * rhs.y,
            z: lhs.z * rhs.z
        )
    }
    
    public static func *= (lhs: inout SCNVector3, rhs: SCNVector3) {
        lhs = lhs * rhs
    }
    
    public static func / (lhs: SCNVector3, factor: CGFloat) -> SCNVector3 {
        let factor = Float(factor)
        return SCNVector3(
            x: lhs.x / factor,
            y: lhs.y / factor,
            z: lhs.z / factor
        )
    }
    
    public static func / (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(
            x: lhs.x / rhs.x,
            y: lhs.y / rhs.y,
            z: lhs.z / rhs.z
        )
    }
}
