import Foundation

//var pizzaInInches: Int = 10 {
//    willSet {
//        print(newValue)
//    }
//
//    didSet {
//        if pizzaInInches >= 18 {
//            print("invalid size specified. pizza in inches set to 18.  old value is \(oldValue)")
//            pizzaInInches = 18
//        }
//    }
//
//}
//
//pizzaInInches = 88
//
//
//var numberOfPeople: Int = 6
//let slicesPerPerson: Int = 5
//
//var numberOfSlices: Int {
//    get {
//        return pizzaInInches - 4
//    }
//    set {
//        print("num slices now has a new value: \(newValue)")
//    }
//}
//
//numberOfSlices = 12
//
//
//var numberOfPizzas: Int {
//    get {
//        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
//        return numberOfPeople /  numberOfPeopleFedPerPizza
//    }
//
//    set {
//        let totalSlices = numberOfSlices * newValue
//        numberOfPeople = totalSlices / slicesPerPerson
//    }
//}
//
//numberOfPizzas = 4
//numberOfPeople

/* Challenge */
/********************************************************************************************************/
var width: Float = 1.5
var height: Float = 2.3

// one bucket of paint can cover 1.5 m^2

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        return Int(ceilf((area / areaCoveredPerBucket)))
    }
    
    set {
        let areaCanCover = Float(newValue) * 1.5
        print(areaCanCover)
    }
}

print(bucketsOfPaint)
