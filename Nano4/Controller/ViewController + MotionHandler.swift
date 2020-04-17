//
//  ViewController + MotionHandler.swift
//  Nano4
//
//  Created by Pedro Giuliano Farina on 15/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import Foundation
import CoreMotion

extension ViewController: MotionHandler {
    func update(rotation: CMRotationRate) {
        let data = CMData(x: rotation.x, y: rotation.y, z: rotation.z)
        let rotationData = withUnsafeBytes(of: data) { Data($0) }
        MultipeerController.shared().sendToAllPeers(rotationData, reliably: false)
    }
}
