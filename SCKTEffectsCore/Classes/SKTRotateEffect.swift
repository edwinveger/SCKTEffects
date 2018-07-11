//
//  SKTRotateEffect.swift
//  SCKTEffectsCore
//
//  Created by Edwin on 10-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

/// Rotates a node to a certain angle.
public class SKTRotateEffect<T: EffectNode>: SKTEffect {
    
    public var duration: TimeInterval = 1.0
    
    public typealias Node = T
    public typealias Property = Node.Rotation
    
    public unowned var node: Node
    public var configuration: EffectConfiguration<Property>
    public var timingFunction: TimingFunction = SKTTimingFunction.linear
    
    public var started = false
    
    public init(node: T) {
        self.node = node
        
        configuration = EffectConfiguration(
            start: node.sckt_rotation,
            method: .by(Property.zero),
            previous: node.sckt_rotation
        )
    }
    
    public func update(_ t: CGFloat) {
        if !started {
            configuration.start = node.sckt_rotation
            configuration.previous = node.sckt_rotation
            started = true
        }
        
        let newAngle = configuration.start + configuration.delta * t
        let diff = newAngle - configuration.previous
        configuration.previous = newAngle
        
        // update the node
        node.sckt_rotation += diff
    }
}
