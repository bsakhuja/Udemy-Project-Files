import UIKit


// MARK: - Step 1. Basic code
//
//func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
//    return operation(n1, n2)
//}
//func multiply(no1: Int, no2: Int) -> Int {
//    return no1 * no2
//}
//
//calculator(n1: 2, n2: 4, operation: multiply)
//
// MARK: - Step 2. Reduce multiply into closure
//
//calculator(n1: 2, n2: 4, operation: { (no1: Int, no2: Int) -> Int in
//    no1 * no2
//})
//
// MARK: - Step 3. Take  advantage of inferred types.
//calculator(n1: 2, n2: 4, operation: { (no1, no2) in
//    no1 * no2
//})
//
// MARK: - Step 4. Flatten
// $0 refers to the first parameter
// $1 refers to the second parameter
// ...etc
//let result = calculator(n1: 2, n2: 4, operation: {$0 * $1})
//
// MARK: - Step 5. Trailing closure
//let result = calculator(n1: 2, n2: 4) {$0 * $1}

// Real example
let array = [6,2,1,5,7,2,4,7,9,7]
let arrayPlusOne = array.map{$0 + 1}
let stringArray = array.map{"\($0)"}

