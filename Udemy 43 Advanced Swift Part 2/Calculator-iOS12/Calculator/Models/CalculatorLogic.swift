//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Brian Sakhuja on 2/24/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (firstNumber: Double, operation: String)?
    
    mutating func setNumber(_ num: Double) {
        self.number = num
    }
    
    mutating func calulate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(secondNumber: n)
            default:
                intermediateCalculation = (firstNumber: n, operation: symbol)
            }
        }
        return nil
    }
    
    private mutating func performTwoNumberCalculation(secondNumber: Double) -> Double? {
        if let firstNumber = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "×":
                return firstNumber * secondNumber
            case "÷":
                return firstNumber / secondNumber
            default:
                fatalError("Operation passed in does not match any of the cases")
            }
        }
        
        return nil
    }
    
}
