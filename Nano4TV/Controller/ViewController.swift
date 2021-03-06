//
//  ViewController.swift
//  Nano4TV
//
//  Created by Pedro Giuliano Farina on 16/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import UIKit
import SpriteKit
import MultipeerConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var spriteView: SKView!
    @IBOutlet weak var lblStatus: StatusLabel!

    let scene: SKScene? = SKScene(fileNamed: "MainScene.sks")

    var players:[MCPeerID: SwordNode] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let scene = scene else {
            lblStatus.showMessage("Scene not loaded!".localized())
            return
        }
        scene.physicsWorld.contactDelegate = self
        lblStatus.showMessage("Connect up to two iPhone devices to have fun :)".localized())
        MultipeerController.shared().delegate = self
        spriteView.presentScene(scene)
    }


}

