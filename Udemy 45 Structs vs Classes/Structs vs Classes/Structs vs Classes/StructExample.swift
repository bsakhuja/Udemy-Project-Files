//
//  StructExample.swift
//  Structs vs Classes
//
//  Created by Brian Sakhuja on 2/24/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

struct Structhero {
    var name: String
    var universe: String
    
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}

/*
 Structs:
 1. Simpler
 2. Faster
 3. Deep copies
 4. True immutability
 5. No memory leaks
 6. Threadsafe
 
 Use a struct by default whenever you want to create a new custom object.
 */
