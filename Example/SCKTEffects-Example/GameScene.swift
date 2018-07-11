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
        
        let timingFunction = getTimingFunction()        
        let action: SKAction
        
        switch counter % 3 {
        case 0:
            let effect = node.moveEffect()
                .withDuration(1.5)
                .using(timingFunction)
                .ending(at: CGPoint(x: size.width / 2, y: size.height / 2))
            
            action = effect.asAction()
        case 1:
            let effect = node.rotateEffect()
                .withDuration(2.5)
                .using(timingFunction)
                .ending(at: .pi)
            
            action = effect.asAction()
        default:
            let effect = node.scaleEffect()
                .withDuration(1.0)
                .using(timingFunction)
                .ending(at: node.scale * 2.3)
            
            action = effect.asAction()
        }
        
        node.run(
            .sequence([
                action,
                .fadeOut(withDuration: 1.0),
                .removeFromParent()
                ])
        )
        
        counter += 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(at: t.location(in: self)) }
    }
    
    private func getTimingFunction() -> TimingFunction {
        switch counter % 4 {
        case 0:
            return SKTTimingFunction.bounceEaseOut
        case 1:
            return SKTTimingFunction.elasticEaseOut
        case 2:
            return SKTTimingFunction.sineEaseInOut
        default:
            return SKTTimingFunction.cubicEaseInOut
        }
    }
}
