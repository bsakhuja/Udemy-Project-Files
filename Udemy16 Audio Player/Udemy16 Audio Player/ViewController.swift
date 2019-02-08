//
//  ViewController.swift
//  Udemy16 Audio Player
//
//  Created by Brian Sakhuja on 9/23/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "blue", ofType: "mp3")
        
        do
        {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            // process any errors
        }
    }

    @IBAction func playButtonTapped(_ sender: Any)
    {
        player.play()
        
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any)
    {
        player.pause()
    }
    
    @IBAction func sliderMoved(_ sender: Any)
    {
        player.volume = slider.value
        
    }
    
}

