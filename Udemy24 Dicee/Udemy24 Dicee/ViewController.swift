//
//  ViewController.swift
//  Udemy24 Dicee
//
//  Created by Brian Sakhuja on 9/29/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftDieIndex: Int = 0
    var rightDieIndex: Int = 0
    var imageArray = [UIImage]()

    @IBOutlet weak var leftDie: UIImageView!
    @IBOutlet weak var rightDie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeImageArray()
        
    }

    @IBAction func rollDice(_ sender: Any)
    {
        updateDice()
    }
    
    func updateDice()
    {
        leftDieIndex = Int.random(in: 0...5)
        rightDieIndex = Int.random(in: 0...5)
        
        updateDiceImages(leftIndex: leftDieIndex, rightIndex: rightDieIndex)
    }
    
    func initializeImageArray()
    {
        for i in 1...6
        {
            imageArray.append(UIImage(named: "dice\(i)")!)
        }
    }
    
    func updateDiceImages(leftIndex: Int, rightIndex: Int)
    {
        leftDie.image = imageArray[leftIndex]
        rightDie.image = imageArray[rightIndex]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == UIEvent.EventSubtype.motionShake
        {
            updateDice()
        }
    }
}

