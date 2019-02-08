//
//  ViewController.swift
//  Udemy6
//
//  Created by Brian Sakhuja on 8/22/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let numberObject = UserDefaults.standard.object(forKey: "phone-number")
        if let number =  numberObject as? String
        {
            phoneLabel.text = number
        }
        else
        {
            phoneLabel.text = "unknown"
        }
    }

    @IBAction func savePressed(_ sender: Any) {
        if let number = textField.text
        {
            UserDefaults.standard.set(number, forKey: "phone-number")
            phoneLabel.text = number
        }
    }
    
}

