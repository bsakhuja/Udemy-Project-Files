//
//  ViewController.swift
//  Pass Data Between VCs
//
//  Created by Brian Sakhuja on 2/12/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
// 2
// Conform to  protocol
class FirstViewController: UIViewController, CanReceive {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var dataPassedBack = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.dataSentForward = textField.text!
            textField.text = ""
            
            // 5
            // Set delegate property
            destinationVC.delegate = self
            
        }
    }
    
    // 3
    // Implement protocol method
    func dataReceived(data: String) {
        label.text = data
    }
    
    
}

