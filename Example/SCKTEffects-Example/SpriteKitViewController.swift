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
        tabBarItem.image = #imageLiteral(resourceName: "spritekit-icon")
        restorationIdentifier = String(describing: type(of: self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        
        view.addSubview(skView)
        
        skView.translatesAutoresizingMaskIntoConstraints = false
        
        // pin skView to safe area, otherwise debug options are not visible
        let constraints =
        [
            skView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            skView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            skView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            skView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        // Present the scene
        skView.presentScene(scene)
        
        // important performance optimization
        skView.ignoresSiblingOrder = true
        
        // debug options
        skView.showsFPS = true
        skView.showsDrawCount = true
        skView.showsNodeCount = true
        skView.showsQuadCount = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scene.size = view.bounds.size
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
