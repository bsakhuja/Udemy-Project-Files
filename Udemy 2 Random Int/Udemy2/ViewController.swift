//
//  ViewController.swift
//  Udemy2
//
//  Created by Brian Sakhuja on 8/8/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func guessFinger(_ sender: Any) {
        let num = Int.random(in: 0...10)
        if let text = textField.text
        {
            if let numGuess = Int(text)
            {
                if  numGuess == num
                {
                    label.text = "Correct!"
                }
                else
                {
                    label.text = "Try again."
                }
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

