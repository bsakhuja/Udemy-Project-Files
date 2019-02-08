//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var currentQuestion: Question?
    var questionNumber: Int = 0
    var score: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startOver()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            self.pickedAnswer = true
        }
        
        if sender.tag == 2 {
            self.pickedAnswer = false
        }
        
        self.checkAnswer()
        self.nextQuestion()
        self.updateUI()
  
    }
    
    
    func updateUI() {
        // Update score label
        self.scoreLabel.text = "\(score)"
        
        // Update question label
        self.questionLabel.text = self.currentQuestion?.questionText
        
        // Update progress label
        self.progressLabel.text = "\(self.questionNumber + 1) / 13"
        
        // Update progress bar
        self.progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(self.questionNumber + 1)
        
      
    }
    

    func nextQuestion() {
        // Check if we have another question in the question list
        if self.questionNumber < self.allQuestions.list.count-1 {
            // Increment question number
            self.questionNumber += 1
            
            // Set current question to the next question
            self.currentQuestion = self.allQuestions.list[questionNumber]
            

        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    func checkAnswer() {
        if pickedAnswer == currentQuestion?.answer { // Correct
            self.score += 1
            ProgressHUD.showSuccess("Correct!")
        } else { // Incorrect
            ProgressHUD.showError("Wrong.")
            
        }
    }
    
    
    func startOver() {
        self.score = 0
        self.questionNumber = 0
        
        let firstQuestion = allQuestions.list[0]
        self.currentQuestion = firstQuestion
        self.questionLabel.text = firstQuestion.questionText
        
        self.updateUI()
       
    }
    

    
}
