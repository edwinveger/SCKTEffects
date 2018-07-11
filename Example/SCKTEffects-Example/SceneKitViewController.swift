//
//  SceneKitViewController.swift
//  SCKTEffects-Example
//
//  Created by Edwin on 11-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import UIKit
import SceneKit
import SCKTEffectsCore
import SCKTEffectsSceneKit

class SceneKitViewController: UIViewController {

    let scene = SCNScene()
    let scnView = SCNView()

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "Scene Kit"
        tabBarItem.image = #imageLiteral(resourceName: "scenekit-icon")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = scnView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scnView.scene = scene

        let sphere = SCNSphere(radius: 2)
        sphere.firstMaterial = SCNMaterial()
        sphere.firstMaterial?.diffuse.contents = UIColor.green
        
        let node = SCNNode(geometry: sphere)
        scene.rootNode.addChildNode(node)
        
        let upPosition = SCNVector3(x: 0, y: 5, z: 0)
        
        let moveUp = SCNNode.moveEffect()
            .to(upPosition)
            .withDuration(2)
            .using(SKTTimingFunction.elasticEaseInOut)
            .asAction()

        let moveDown = SCNNode.moveEffect()
            .to(.zero)
            .withDuration(2)
            .using(SKTTimingFunction.bounceEaseOut)
            .asAction()
        
        node.runAction(
            .repeatForever(
                .sequence(
                    [moveUp,
                     .wait(duration: 1.0),
                     moveDown,
                     .wait(duration: 1.0)]
                )
            )
        )
        
        let cameraNode = SCNNode()
        cameraNode.position.z = 15
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        scnView.pointOfView = cameraNode
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
