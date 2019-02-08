//
//  Question.swift
//  Quizzler
//
//  Created by Brian Sakhuja on 1/30/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
    
}
