//
//  MotionHandler.swift
//  Nano4
//
//  Created by Pedro Giuliano Farina on 15/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import CoreMotion

public protocol MotionHandler{
    func update(attitude:CMAttitude, acceleration: CMAcceleration, gravity:CMAcceleration)
}
