//
//  SecondViewController.swift
//  Pass Data Between VCs
//
//  Created by Brian Sakhuja on 2/12/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit

// 1
// Create a protocol
protocol CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var dataSentForward = ""
    
    // 4
    // Create delegate property
    var delegate: CanReceive?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = dataSentForward
    }

    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataReceived(data: textField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
}
