//
//  MotionManager.swift
//  TripCoreMotion20
//
//  Created by cmStudent on 2022/08/23.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
   //MARK: motion manager properties
    @Published var manager: CMMotionManager = .init()
    @Published var xValue: CGFloat = 0
    
    //MARK: current slide
    @Published var currentSlide: Place = sample_places.first!
    
    func detectMotion() {
        if !manager.isDeviceMotionActive {
            //MARK: for memory usage
            manager.deviceMotionUpdateInterval = 1/40
            manager.startDeviceMotionUpdates(to: .main) { [weak self]motion, err in
                if let attitude = motion?.attitude {
                    //MAKR: obtaning device roll value
                    self?.xValue = attitude.roll
                    print(attitude.roll)
                }
            }
        }
    }
    
    //MARK: stopping updates when its not necessary
    func stopMotionUpdates() {
        manager.stopDeviceMotionUpdates()
    }
}

//class MotionManager: ObservableObject {
//    @Published var manager: CMMotionManager = .init()
//    @Published var xValue: CGFloat = 0
//
//    @Published var currentSlide: Place = sample_places.first!
//
//    func detectMotion() {
//        if !manager.isDeviceMotionActive {
//            manager.deviceMotionUpdateInterval = 1/40
//            manager.startDeviceMotionUpdates(to: .main) { [weak self] motion, error in
//                if let attitude = motion?.attitude {
//                    self?.xValue = attitude.roll
//                    print(attitude.roll)
//                }
//            }
//        }
//    }
//
//    func StopMotionUpdates() {
//        manager.stopDeviceMotionUpdates()
//    }
//
//}
