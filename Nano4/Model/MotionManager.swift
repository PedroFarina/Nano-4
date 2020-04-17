//
//  MotionManager.swift
//  Nano4
//
//  Created by Pedro Giuliano Farina on 15/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import Foundation
import CoreMotion

public class MotionManager{
    public static func shared() -> MotionManager {
        return sharedInstance
    }
    private static let sharedInstance:  MotionManager = {
        let mm = MotionManager()
        return mm
    }()
    
    private init(){
        motion = CMMotionManager()
        if motion.isGyroAvailable {
            motion.startGyroUpdates()
        }
        TimeInterval = 1/60
    }
    private let motion:CMMotionManager

    public var motionDelegate:MotionHandler?
    {
        didSet{
            if motionDelegate == nil{
                motion.stopGyroUpdates()
                timer?.invalidate()
            }
            else{
                if !motion.isGyroActive {
                    motion.startGyroUpdates()
                    TimeInterval = 1/60
                }
            }
        }
    }

    private var timer:Timer?{
        didSet{
            if let timer = timer {
                RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
            }
        }
    }

    public var TimeInterval:TimeInterval{
        get{
            return motion.gyroUpdateInterval
        }
        set{
            motion.gyroUpdateInterval = newValue
            timer?.invalidate()
            timer = Timer(fire: Date(), interval: newValue, repeats: true, block: { (_) in self.getMotion() })
        }
    }

    private func getMotion() {
        if let gyroData = self.motion.gyroData {
            self.motionDelegate?.update(rotation: gyroData.rotationRate)
        }
    }
}
