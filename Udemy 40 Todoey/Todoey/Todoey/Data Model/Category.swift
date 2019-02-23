//
//  Category.swift
//  Todoey
//
//  Created by Brian Sakhuja on 2/22/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    // 'dynamic' is a declaration modifier. Tells the runtime to use dynamic dispatch over the standard 'static' dispatch.  Allows name to be monitored for change at runtime. If the user changes the value of name while the app is running, it allows realm to dynamically update those changes in the database.
    // essentially '@objc dynamic' allows realm to monitor for changes to update the database
    @objc dynamic var name: String = ""
    var items = List<Item>()
    @objc dynamic var color: String = ""
    
}
