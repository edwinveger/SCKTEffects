//
//  SpriteKitViewController.swift
//  SpriteKitDemo
//
//  Created by Edwin on 09-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class SpriteKitViewController: UIViewController {

    let skView = SKView()
    let scene = GameScene()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = "Sprite Kit"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = skView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        // Present the scene
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scene.size = view.bounds.size
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
