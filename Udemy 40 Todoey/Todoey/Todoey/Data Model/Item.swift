//
//  Item.swift
//  Todoey
//
//  Created by Brian Sakhuja on 2/21/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation

class Item: Codable {
    var title : String
    var done : Bool
    
    init(title: String) {
        self.title = title
        self.done = false
    }
}
