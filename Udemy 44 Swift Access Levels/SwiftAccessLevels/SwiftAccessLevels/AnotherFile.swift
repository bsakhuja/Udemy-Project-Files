//
//  AnotherFile.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class AnotherClassInAnotherFile {
    
    init() {
        
        //Step 8. Try to print aFilePrivateProperty Here
        // impossible to print aFilePrivateProperty since its located in another file
        
        //Step 10. Try to print anInternalProperty Here
        print("\(aClass.anInternalProperty) printed from init() in AnotherFlassInAnotherFile")
        
    }
    
}
