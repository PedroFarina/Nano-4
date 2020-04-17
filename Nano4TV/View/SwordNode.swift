//
//  SwordNode.swift
//  Nano4TV
//
//  Created by Pedro Giuliano Farina on 17/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import SpriteKit

public class SwordNode: SKSpriteNode {
    func setup() {
        let body = SKPhysicsBody(circleOfRadius: size.width/4)
        body.affectedByGravity = false
        body.allowsRotation = true
        body.friction = 0.5
        body.categoryBitMask = 0x1
        body.collisionBitMask = 0x1
        body.contactTestBitMask = 0x1
        self.physicsBody = body
    }
}
