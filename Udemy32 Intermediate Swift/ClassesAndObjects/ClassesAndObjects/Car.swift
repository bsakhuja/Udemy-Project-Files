//
//  Car.swift
//  ClassesAndObjects
//
//  Created by Brian Sakhuja on 2/7/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar: CarType = .Hatchback
    
    init() {
        
    }
    
    convenience init(color: String, numberOfSeats: Int, typeOfCar: CarType) {
        self.init()
        self.color = color
        self.numberOfSeats = numberOfSeats
        self.typeOfCar = typeOfCar
    }
    
    func drive() {
        print("Car is moving")
    }
}
