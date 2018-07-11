//
//  CGPoint+Mathable.swift
//  SCKTEffectsCore
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//


extension CGPoint: Mathable {
    
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(
            x: lhs.x - rhs.x,
            y: lhs.y - rhs.y
        )
    }
    
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(
            x: lhs.x + rhs.x,
            y: lhs.y + rhs.y
        )
    }
    
    public static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    public static func * (lhs: CGPoint, factor: CGFloat) -> CGPoint {
        return CGPoint(
            x: lhs.x * factor,
            y: lhs.y * factor
        )
    }
    
    public static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(
            x: lhs.x * rhs.x,
            y: lhs.y * rhs.y
        )
    }
    
    public static func *= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs * rhs
    }
    
    public static func / (lhs: CGPoint, factor: CGFloat) -> CGPoint {
        return CGPoint(
            x: lhs.x / factor,
            y: lhs.y / factor
        )
    }
    
    public static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(
            x: lhs.x / rhs.x,
            y: lhs.y / rhs.y
        )
    }
}

