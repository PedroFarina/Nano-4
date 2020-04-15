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
        if motion.isDeviceMotionActive {
            motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        }
        if motion.isAccelerometerAvailable {
            motion.startAccelerometerUpdates()
        }
        TimeInterval = 1/60
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval) {
            self.setOrigin()
        }
    }
    private let motion:CMMotionManager

    public var referenceAttitude: CMAttitude?
    public func setOrigin() {
        self.referenceAttitude = self.motion.deviceMotion?.attitude
    }

    public var motionDelegate:MotionHandler?
    {
        didSet{
            if motionDelegate == nil{
                motion.stopDeviceMotionUpdates()
                motion.stopAccelerometerUpdates()
                timer?.invalidate()
            }
            else{
                if !motion.isDeviceMotionActive {
                    motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
                    motion.startAccelerometerUpdates()
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
            return motion.deviceMotionUpdateInterval
        }
        set{
            motion.deviceMotionUpdateInterval = newValue
            motion.accelerometerUpdateInterval = newValue

            timer?.invalidate()
            timer = Timer(fire: Date(), interval: newValue, repeats: true, block: { (_) in self.getMotion() })
        }
    }

    private func getMotion() {
        if let motionData = self.motion.deviceMotion,
            let accData = self.motion.accelerometerData {

            let relativeAttitude:CMAttitude = motionData.attitude
            if let ref = self.referenceAttitude {
                relativeAttitude.multiply(byInverseOf: ref)
            }

            self.motionDelegate?.update(attitude: relativeAttitude, acceleration: accData.acceleration, gravity: motionData.gravity)
        }
    }
}
