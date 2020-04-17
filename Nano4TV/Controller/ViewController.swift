//
//  ViewController.swift
//  Nano4TV
//
//  Created by Pedro Giuliano Farina on 16/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var spriteView: SKView!
    @IBOutlet weak var lblStatus: StatusLabel!

    let scene: SKScene = SKScene()

    var firstPlayerSword: SKSpriteNode = SKSpriteNode(imageNamed: "Sword")

    override func viewDidLoad() {
        super.viewDidLoad()
        MultipeerController.shared().delegate = self
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        spriteView.presentScene(scene)
        spriteView.showsFPS = true
        spriteView.showsNodeCount = true
        firstPlayerSword.setScale(0.0014)
        firstPlayerSword.position.x += 0.3
        scene.addChild(firstPlayerSword)
    }


}

