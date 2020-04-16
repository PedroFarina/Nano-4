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
    func update(attitude: CMAttitude, acceleration: CMAcceleration, gravity: CMAcceleration) {
        guard let host = host else {
            return
        }
        let data = CMData(yaw: attitude.yaw, roll: attitude.roll, pitch: attitude.pitch, accelerationX: acceleration.x, accelerationY: acceleration.y, accelerationZ: acceleration.z)
        let coreMotionData =  withUnsafeBytes(of: data) { Data($0) }
        MultipeerController.shared().sendToPeers(coreMotionData, reliably: false, peers: [host])

    }
}
