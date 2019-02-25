//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Brian Sakhuja on 2/24/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calulate(symbol: String) -> Double? {
            if symbol == "+/-" {
                return number * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return number * 0.01
            }
        return nil
    }

}
