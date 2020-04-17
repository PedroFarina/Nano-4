//
//  ViewController + Multipeer.swift
//  Nano4TV
//
//  Created by Pedro Giuliano Farina on 16/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import Foundation
import MultipeerConnectivity

extension ViewController: MultipeerHandler {
    func peerReceivedInvitation(_ id: MCPeerID) -> Bool {
        DispatchQueue.main.async {
            self.lblStatus.showMessage(id.displayName + " is trying to join.".localized())
        }
        return MultipeerController.shared().connectedPeers.count < 2
    }

    func peerJoined(_ id: MCPeerID) {
        DispatchQueue.main.async {
            self.lblStatus.showMessage(id.displayName + " has connected.".localized())
        }
    }
    func peerLeft(_ id: MCPeerID) {
        DispatchQueue.main.async {
            self.lblStatus.showMessage(id.displayName + " has disconnected.".localized())
        }
    }

    func receivedData(_ data: Data, from peerID: MCPeerID) {
        let value = data.withUnsafeBytes {
            $0.load(as: CMData.self)
        }
        guard let sword = firstPlayerSword else {
            return
        }
        let zValue = sword.zRotation + CGFloat(value.z/100)
        if zValue <= -.pi/15 {
            sword.physicsBody?.applyForce(CGVector(dx: 700, dy: 0))
            sword.zRotation = -.pi/14
        } else if zValue >= .pi/15 {
            sword.physicsBody?.applyForce(CGVector(dx: -700, dy: 0))
            sword.zRotation = .pi/14
        } else {
            sword.zRotation = zValue
        }

    }
}
