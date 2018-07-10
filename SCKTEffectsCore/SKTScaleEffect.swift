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
    
    public unowned var node: Node
    public var configuration: EffectConfiguration<Property>
    public var timingFunction: TimingFunction = SKTTimingFunction.linear
    
    public init(node: T) {
        self.node = node
        
        configuration = EffectConfiguration(
            start: node.scale,
            end: node.scale,
            previous: node.scale
        )
    }
    
    public func update(_ t: CGFloat) {
        let newScale = configuration.start + configuration.delta * t
        let diff = newScale / configuration.previous
        configuration.previous = newScale
        
        // update the node
        node.scale *= diff
    }
}
