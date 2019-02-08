import UIKit

// Use a while loop to add 1 to each of the elements
//var array = [7, 23, 98, 1, 0, 763]
//var i = 0
//while i < array.count
//{
//    array[i] = array[i] + 1
//    i += 1
//}
//
//print(array)

// Halve each value in array
var array = [8, 7, 19, 28] as [Double]
for (index, value) in array.enumerated()
{
    array[index] = value/2
}
print(array)
