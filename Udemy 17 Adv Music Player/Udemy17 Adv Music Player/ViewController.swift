//
//  ViewController.swift
//  Udemy17 Adv Music Player
//
//  Created by Brian Sakhuja on 9/23/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "blue", ofType: "mp3")
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeSlider.value = Float(0)
        

        
        do
        {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            timeSlider.maximumValue = Float(player.duration)
        }
        catch
        {
            // process error
        
        }
    }

    @IBAction func playButtonTapped(_ sender: Any)
    {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.updateTimeSlider) , userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any)
    {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any)
    {
        timer.invalidate()
        timeSlider.value = 0
        
        do
        {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            // process error
            
        }
    }
    @IBAction func volumeSliderMoved(_ sender: Any)
    {
        player.volume = volumeSlider.value
        
    }
    @IBAction func timeSliderMoved(_ sender: Any)
    {
        player.currentTime = TimeInterval(timeSlider.value)
        
    }
    
    @objc func updateTimeSlider()
    {
        timeSlider.value = Float(player.currentTime)
        
    }
}

