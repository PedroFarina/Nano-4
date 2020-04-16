//
//  ViewController.swift
//  Nano4TV
//
//  Created by Pedro Giuliano Farina on 16/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStatus: StatusLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        MultipeerController.shared().delegate = self
    }


}

