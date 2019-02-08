import UIKit

var str = "Hello my name is  hombre!!!!"

for character in str
{
    print(character)
}

let newTypeString = NSString(string: str)

newTypeString.substring(to: 5)
newTypeString.substring(from: 4)

newTypeString.substring(with: NSRange(location: 2, length: 3))

if newTypeString.contains("ello")
{
    print(true)
}

newTypeString.components(separatedBy: " ")
newTypeString.uppercased
newTypeString.lowercased
