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

    let scene: SKScene? = SKScene(fileNamed: "MainScene.sks")

    lazy var firstPlayerSword: SwordNode? = scene?.childNode(withName: "Sword1") as? SwordNode
    lazy var secondPlayerSword: SwordNode? = scene?.childNode(withName: "Sword2") as? SwordNode

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let scene = scene else {
            lblStatus.showMessage("Scene not loaded!")
            return
        }
        firstPlayerSword?.setup()
        secondPlayerSword?.setup()
        MultipeerController.shared().delegate = self
        spriteView.presentScene(scene)
    }


}

