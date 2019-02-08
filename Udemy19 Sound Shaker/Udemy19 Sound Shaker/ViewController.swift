//
//  ViewController.swift
//  Udemy19 Sound Shaker
//
//  Created by Brian Sakhuja on 9/23/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake
        {
            
        }
    }


}

