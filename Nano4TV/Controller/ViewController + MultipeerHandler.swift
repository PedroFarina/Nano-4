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
        return MultipeerController.shared().connectedPeers.isEmpty
    }
}
