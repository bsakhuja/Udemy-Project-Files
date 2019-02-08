//
//  ViewController.swift
//  Udemy3
//
//  Created by Brian Sakhuja on 8/16/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultsLabel.text = ""
    }

    @IBAction func calculatePrime(_ sender: Any) {
        if let text = textField.text // if user input text
        {
            if let numberInput = Int(text) // if text is integer
            {
                var i = 2
                var isPrime = true
                while i < numberInput
                {
                    if numberInput % i == 0
                    {
                        isPrime = false
                    }
                    i += 1
                }
                
                if isPrime || numberInput == 1 || numberInput == 2
                {
                    resultsLabel.text = "Yes, \(text) is prime!"
                }
                else
                {
                    resultsLabel.text = "No, \(text) is not prime."
                }
            }
            
        }
        
    }
    
}

