import UIKit

// MARK: - IF ELSE
//
//func loveCalculator(yourName: String, theirName: String) -> String
//{
//    let loveScore = Int.random(in: 0...100)
//
//    if loveScore > 80
//    {
//        return "Your love score is: \(loveScore). You love each other like Kanye loves Kanye"
//    }
//    else if loveScore > 40 && loveScore <= 80
//    {
//        return "Your love score is: \(loveScore). YOu go together like coke and mentos"
//    }
//    else
//    {
//        return "Your love score is: \(loveScore). No love possible, you'll be forever alone"
//    }
//}
//
//print(loveCalculator(yourName: "Jack Bauer", theirName: "Angela Yu"))


// MARK: - BMI Calculator
//func calculateBMI(height: Int, mass: Int) -> String
//{
//    let bmi = Float(mass)/(Float(height)*Float(height))
//
//    if bmi > 25
//    {
//        return "Your BMI is \(bmi).  You are overweight."
//    }
//    else if bmi > 18.5 && bmi <= 25
//    {
//        return "Your BMI is \(bmi). You are of normal weight"
//    }
//    else
//    {
//        return "Your BMI is \(bmi). You are underweight"
//    }
//}
//
//print(calculateBMI(height: 2, mass: 79))

// MARK: - Fibonacci Sequence
func fibonacciSequence(forThisManyIterations: Int)
{
    print(0)
    print(1)
    
    var num1 = 0
    var num2 = 1
    
    for iteration in 0...forThisManyIterations
    {
        let num = num1 + num2
        print(num)
        
        num1 = num2
        num2 = num
        
    }
    
}

fibonacciSequence(forThisManyIterations: 50)
