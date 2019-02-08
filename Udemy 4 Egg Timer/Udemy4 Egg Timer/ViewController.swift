//
//  ViewController.swift
//  Udemy4 Egg Timer
//
//  Created by Brian Sakhuja on 8/21/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var seconds = 210

    @IBOutlet weak var time: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func updateTime() {
        if seconds > 0
        {
            seconds -= 1
        }
        
        self.updateTimeLabel()
    }
    
    func updateTimeLabel() {
        time.text = String(describing: seconds)
    }
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func sub10Sec(_ sender: Any) {
        if seconds > 10
        {
            seconds -= 10
            self.updateTimeLabel()
        }
        
    }
    
    @IBAction func add10Sec(_ sender: Any) {
        if seconds < 10000
        {
            seconds += 10
            self.updateTimeLabel()
        }
        
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        seconds = 210
        self.updateTimeLabel()
    }
}

