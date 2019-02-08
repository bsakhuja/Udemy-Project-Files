//
//  main.swift
//  ClassesAndObjects
//
//  Created by Brian Sakhuja on 2/7/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

let myCar = Car(color: "blue", numberOfSeats: 9, typeOfCar: .Coupe)
let smartCar = SelfDrivingCar(color: "red", numberOfSeats: 3, typeOfCar: .Sedan)

smartCar.drive()

