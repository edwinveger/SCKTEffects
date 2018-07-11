//
//  SKTScaleEffect.swift
//  SCKTEffectsCore
//
//  Created by Edwin on 10-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

/// Scales a node to a certain scale factor.
public class SKTScaleEffect<T: EffectNode>: SKTEffect {
    
    public var duration: TimeInterval = 1.0
    
    public typealias Node = T
    public typealias Property = Node.Scale
    
    public var configuration: EffectConfiguration<Property> = EffectConfiguration(
        start: .zero,
        method: .by(.zero),
        previous: .zero
    )
    
    public var timingFunction: TimingFunction = SKTTimingFunction.linear
    
    public var started = false
    
    public func update(node: T, at time: CGFloat) {
        if !started {
            configuration.start = node.sckt_scale
            configuration.previous = node.sckt_scale
            started = true
        }
        
        let newScale = configuration.start + configuration.delta * time
        let diff = newScale / configuration.previous
        configuration.previous = newScale
        
        // update the node
        node.sckt_scale *= diff
    }
}
