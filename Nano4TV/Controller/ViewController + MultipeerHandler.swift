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
        return MultipeerController.shared().connectedPeers.isEmpty
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
}
