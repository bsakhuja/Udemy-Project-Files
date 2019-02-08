//
//  SelfDrivingCar.swift
//  ClassesAndObjects
//
//  Created by Brian Sakhuja on 2/7/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    var destination: String?
    
    override init() {
        super.init()
        destination = "One Infinite Loop"
    }
    
    override func drive() {
        print("Driving to \(destination!)")
        
    }
}
