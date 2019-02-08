//
//  ViewController.swift
//  Udemy1
//
//  Created by Brian Sakhuja on 8/6/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonClicked(_ sender: Any) {
        if let age = textField.text
        {
            let catYears = Int(age)! * 7
            label.text = "Your cat is \(catYears) in cat years"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

