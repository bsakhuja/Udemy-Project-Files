//
//  main.swift
//  Structs vs Classes
//
//  Created by Brian Sakhuja on 2/24/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

/******************************************************/
// Class is a reference type
var classhero = Classhero(name: "Iron Man", universe: "Marvel")

var anotherMarvelclasshero = classhero
anotherMarvelclasshero.name = "The Hulk"

print("classhero name: \(classhero.name)") // Prints "The Hulk"
print("anotherMarvelclasshero name: \(anotherMarvelclasshero.name)") // Prints "The Hulk"

var classAvengers = [classhero, anotherMarvelclasshero]
classAvengers[0].name = "Thor"

print("classAvengers changed first name in array: \(classAvengers)")


/******************************************************/
// Struct is a value type (as well as enums and tuples)

var structhero = Structhero(name: "Spiderman", universe: "Marvel")

var anotherMarvelstructhero = structhero
anotherMarvelstructhero.name = "Captain America"

print("structhero name: \(structhero.name)") // Prints "Spiderman"
print("anotherMarvelstructhero name: \(anotherMarvelstructhero.name)") // Prints "Captain America"

var structAvengers = [structhero, anotherMarvelstructhero]
structAvengers[0].name = "Black Widow"

print("structAvengers changed first name in array: \(structAvengers)")


/******************************************************/

let letClassHero = Classhero(name: "Iron Man", universe: "Marvel")

letClassHero.name = "Cat Woman"
letClassHero.universe = "DC"

let letStructHero =  Structhero(name: "Iron Man", universe: "Marvel")

//letStructHero.name = "Cat Woman" // Error: let constant
//letStructHero.universe = "DC" // Error: let constant

print("\(structhero.reverseName())")
