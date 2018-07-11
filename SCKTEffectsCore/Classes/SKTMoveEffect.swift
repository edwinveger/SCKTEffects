//
//  SKTMoveEffect.swift
//  SCKTEffectsCore
//
//  Created by Edwin on 10-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

/// Moves a node from its current position to a new position.
public class SKTMoveEffect<T: EffectNode>: SKTEffect {
    
    public var duration: TimeInterval = 1.0
    
    public typealias Node = T
    public typealias Property = Node.Position
    
    public var configuration: EffectConfiguration<Property> = EffectConfiguration(
        start: .zero,
        method: .by(.zero),
        previous: .zero
    )
    
    public var timingFunction: TimingFunction = SKTTimingFunction.linear
    
    public var started = false
    
    public func update(node: T, at time: CGFloat) {
        if !started {
            // this is the start of the animation, so keep the current position as the starting position
            configuration.start = node.sckt_position
            configuration.previous = node.sckt_position
            started = true
        }
        
        // This allows multiple SKTMoveEffect objects to modify the same node at the same time.
        let newPosition = configuration.start + configuration.delta * time
        let diff = newPosition - configuration.previous
        configuration.previous = newPosition
        
        // update the node
        node.sckt_position += diff
    }
}
