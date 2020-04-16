//
//  ViewController.swift
//  Nano4
//
//  Created by Pedro Giuliano Farina on 15/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {
    @IBOutlet weak var lblStatus: StatusLabel!
    var host: MCPeerID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MultipeerController.shared().delegate = self
        MotionManager.shared().motionDelegate = self
    }


}

