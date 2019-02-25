//
//  ClassExample.swift
//  Structs vs Classes
//
//  Created by Brian Sakhuja on 2/24/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

class Classhero {
    var name: String
    var universe: String
    
    init(name: String, universe: String) {
        self.name = name
        self.universe = universe
    }
}

/*
 Classes:
 1. Have inheritance
 2. Works with objective-c code
 
 Use classes only when you need inheritance or to work with objective-c code.
 */
