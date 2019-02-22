//
//  Item.swift
//  Todoey
//
//  Created by Brian Sakhuja on 2/22/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
    
}
