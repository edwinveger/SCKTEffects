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

    let scene = SCNScene(named: "art.scnassets/scene.scn")!
    let scnView = SCNView()

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "Scene Kit"
        tabBarItem.image = #imageLiteral(resourceName: "scenekit-icon")
        restorationIdentifier = String(describing: type(of: self))
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
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        
        setupObjects()
    }
    
    private func setupObjects() {
        let count = SKTTimingFunction.timingFunctions.count
        
        let coordinates = (0..<count)
            .map { $0 - count / 2 }
            .map { Float($0) }
        
        let clay = SCNMaterial()
        clay.lightingModel = .physicallyBased
        clay.diffuse.contents = UIColor(white: 0.8, alpha: 1.0)
        clay.metalness.contents = 0.05
        clay.roughness.contents = 0.8
        
        let metal = SCNMaterial()
        metal.lightingModel = .physicallyBased
        metal.diffuse.contents = UIColor(white: 0.6, alpha: 1.0)
        metal.metalness.contents = 0.8
        metal.roughness.contents = 0.05
        
        for (x, (timingFunction, name)) in zip(coordinates, SKTTimingFunction.timingFunctions) {
            let rootNode = SCNNode()
            rootNode.name = "Function: \(name)"
            rootNode.position.x = x
            scene.rootNode.addChildNode(rootNode)
            
            let movementOffset: Float = 2.0
            let radius: CGFloat = 0.2
            
            let box = SCNBox(
                width: 0.75,
                height: 0.1,
                length: 2 * (CGFloat(movementOffset) + radius),
                chamferRadius: 0.005
            )
            box.chamferSegmentCount = 2
            box.firstMaterial = clay
            let boxNode = SCNNode(geometry: box)
            boxNode.name = "track"
            boxNode.position.y -= Float(box.height) / 2
            rootNode.addChildNode(boxNode)
            
            let text = SCNText(string: name, extrusionDepth: 0.1)
            text.firstMaterial = clay
            text.font = UIFont.boldSystemFont(ofSize: 1.0)
            text.flatness = 0.005
            let textNode = SCNNode(geometry: text)
            textNode.eulerAngles.y = .pi / 2
            textNode.name = "text: \(name)"
            textNode.position.x = -0.35
            textNode.position.y = -0.5
            textNode.position.z = textNode.boundingSphere.radius - movementOffset
            textNode.scale = SCNVector3(x: 0.5, y: 0.5, z: 0.5)
            rootNode.addChildNode(textNode)
            
            let sphere = SCNSphere(radius: radius)
            sphere.firstMaterial = metal
            let node = SCNNode(geometry: sphere)
            node.name = "sphere"
            node.position.x = 0
            node.position.y = Float(radius)
            node.position.z = movementOffset
            rootNode.addChildNode(node)
            
            let offset = SCNVector3(x: 0, y: 0, z: -2 * movementOffset)
            
            let moveUp = SCNNode.moveEffect()
                .by(offset)
                .withDuration(3.0)
                .using(timingFunction)
                .asAction()
            
            let moveDown = SCNNode.moveEffect()
                .to(node.position)
                .withDuration(0.5)
                .using(SKTTimingFunction.backEaseOut)
                .asAction()
            
            node.runAction(
                .repeatForever(
                    .sequence([moveUp, .wait(duration: 0.5), moveDown, .wait(duration: 1.1)])
                )
            )
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
