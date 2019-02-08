//
//  ViewController.swift
//  Udemy10 Animations
//
//  Created by Brian Sakhuja on 9/10/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeGame = true
    
    // 1 = noughts
    // 2 = crosses
    var activePlayer = 1
    
    // 0 = empty
    // 1 = noughts
    // 2 = crosses
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,5,8], [2,4,6]]
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let activePosition = sender.tag! - 1
        
        if gameState[activePosition] == 0 && activeGame
        {
            gameState[activePosition] = activePlayer
            if activePlayer == 1
            {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                
            }
            else if activePlayer == 2
            {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                
            }
            
        }
        
        for combination in winningCombinations
        {
            let firstPosition = gameState[combination[0]]
            let secondPosition = gameState[combination[1]]
            let thirdPosition = gameState[combination[2]]
            if firstPosition != 0 && firstPosition == secondPosition && secondPosition == thirdPosition //1 1 1 or 2 2 2
            {
                // we have a winner
                activeGame = false
                label.isHidden = false
                playAgainButton.isHidden = false
                
                if gameState[combination[0]] == 1
                {
                    self.label.text = "Noughts wins!"
                    
                    
                }
                else if gameState[combination[0]] == 2
                {
                    self.label.text = "Crosses wins!"
                
                }
                
                UIView.animate(withDuration: 1, animations: {
                    self.label.center = CGPoint(x: self.label.center.x + 500, y: self.label.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    
                })
    
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        playAgainButton.isHidden = true
        
        label.center = CGPoint(x: label.center.x - 500, y: label.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    @IBAction func playAgainTapped(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        
        label.isHidden = true
        playAgainButton.isHidden = true
        
        label.center = CGPoint(x: label.center.x - 500, y: label.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        for i in 1..<10
        {
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
            }
        }
    }
    
}

