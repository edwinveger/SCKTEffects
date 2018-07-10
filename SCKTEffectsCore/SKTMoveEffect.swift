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
    
    public unowned var node: Node
    public var configuration: EffectConfiguration<Property>
    public var timingFunction: TimingFunction = SKTTimingFunction.linear
    
    public init(node: T) {
        self.node = node
        
        configuration = EffectConfiguration(
            start: node.position,
            end: node.position,
            previous: node.position
        )
    }
    
    public func update(_ t: CGFloat) {
        // This allows multiple SKTMoveEffect objects to modify the same node at the same time.
        let newPosition = configuration.start + configuration.delta * t
        let diff = newPosition - configuration.previous
        configuration.previous = newPosition
        
        // update the node
        node.position += diff
    }
}
