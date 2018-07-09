//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SpriteKit
import SCKTEffectsCore
import SCKTEffectsSpriteKit

class GameScene: SKScene {
    
    private let label = SKLabelNode()
    
    private func touchDown(at point: CGPoint) {
        let node = SKSpriteNode(color: .green, size: .init(width: 32, height: 32))
        node.position = point
        addChild(node)
        
        let effect = SKTMoveEffect<SKNode>(
            node: node,
            duration: 1.5,
            startPosition: point,
            endPosition: point + CGPoint(x: 100, y: 100)
        )
        effect.timingFunction =
            point.x.truncatingRemainder(dividingBy: 2.0) == 0 ?
                SKTTimingFunction.bounceEaseOut :
                SKTTimingFunction.elasticEaseOut
        
        let scaleUp = SKTScaleEffect<SKNode>(
            node: node,
            duration: 1.5,
            startScale: node.scale,
            endScale: CGPoint(x: 2.1, y: 3.25)
        )
        
        scaleUp.timingFunction = SKTTimingFunction.elasticEaseOut
        
        node.run(
            .sequence([
                effect.asAction(),
                scaleUp.asAction(),
                .removeFromParent()
                ])
        )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(at: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
