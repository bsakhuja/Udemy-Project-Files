//
//  ViewController.swift
//  Udemy25 Magic 8 Ball
//
//  Created by Brian Sakhuja on 9/29/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    var imageIndex: Int = 0
    var imageArray = [UIImage(named: "ball1"), UIImage(named: "ball2"), UIImage(named: "ball3"), UIImage(named: "ball4"), UIImage(named: "ball5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
    }
    
    func updateImage()
    {
        imageIndex = Int.random(in: 0...4)
        ball.image = imageArray[imageIndex]
    }

    @IBAction func askButtonPressed(_ sender: UIButton)
    {
        updateImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == UIEvent.EventSubtype.motionShake
        {
            updateImage()
        }
    }
    
}

