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
    
    var counter = 0
    
    private func touchDown(at point: CGPoint) {
        let color: UIColor
        
        switch counter % 3 {
        case 0:
            color = .green
        case 1:
            color = .blue
        default:
            color = .red
        }
        
        let node = SKSpriteNode(color: color, size: .init(width: 32, height: 32))
        node.position = point
        addChild(node)
        
        let effect: SKTEffect<SKNode>
        
        switch counter % 3 {
        case 0:
            effect = SKTMoveEffect(
                node: node,
                duration: 1.5,
                from: node.position,
                to: CGPoint(x: size.width / 2, y: size.height / 2)
            )
        case 1:
            effect = SKTRotateEffect(
                node: node,
                duration: 2.5,
                from: node.rotation,
                to: .pi
            )
        default:
            effect = SKTScaleEffect(
                node: node,
                duration: 1.0,
                from: node.scale,
                to: node.scale * 2.3
            )
        }
        
        switch counter % 4 {
        case 0:
            effect.timingFunction = SKTTimingFunction.bounceEaseOut
        case 1:
            effect.timingFunction = SKTTimingFunction.elasticEaseOut
        case 2:
            effect.timingFunction = SKTTimingFunction.sineEaseInOut
        default:
            effect.timingFunction = SKTTimingFunction.cubicEaseInOut
        }
        
        node.run(
            .sequence([
                effect.asAction(),
                .fadeOut(withDuration: 1.0),
                .removeFromParent()
                ])
        )
        
        counter += 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(at: t.location(in: self)) }
    }
}
