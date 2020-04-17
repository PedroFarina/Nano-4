//
//  ViewController + ContactDelegate.swift
//  Nano4TV
//
//  Created by Pedro Giuliano Farina on 17/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import SpriteKit

extension ViewController: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if let particle = SKEmitterNode(fileNamed: "Catchim.sks") {
            particle.position = contact.contactPoint
            particle.position.y += CGFloat(Double.random(in: -100...300))
            scene?.addChild(particle)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                particle.removeFromParent()
            }
        }
    }
}
