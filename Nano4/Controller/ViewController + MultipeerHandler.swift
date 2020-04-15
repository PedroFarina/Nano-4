//
//  ViewController + MultipeerHandler.swift
//  Nano4
//
//  Created by Pedro Giuliano Farina on 15/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import Foundation
import MultipeerConnectivity

extension ViewController: MultipeerHandler {

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

    func peerDiscovered(_ id: MCPeerID) -> Bool {
        DispatchQueue.main.async {
            self.lblStatus.showMessage(id.displayName + " was found.".localized())
        }
        return true
    }

    func peerLost(_ id: MCPeerID) {
        DispatchQueue.main.async {
            self.lblStatus.showMessage("Lost connection to ".localized() + id.displayName)
        }
    }

    func receivedData(_ data: Data, from peerID: MCPeerID) {
    }
}
