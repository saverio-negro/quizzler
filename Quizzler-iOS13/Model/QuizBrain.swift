//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Saverio Negro on 19/06/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz: [Question]
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        let correctAnswer = self.quiz[questionNumber].correctAnswer
        
        if userAnswer == correctAnswer {
            score += 1
            return true
        }
        
        return false
    }
    
    mutating func nextQuestion() {
        if self.questionNumber + 1 < self.quiz.count {
            self.questionNumber += 1
        } else {
            self.questionNumber = 0
            self.score = 0
        }
    }
    
    func getAnswer(index: Int) -> String {
        return self.quiz[self.questionNumber].answer[index]
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    func getQuestion() -> String {
        return self.quiz[self.questionNumber].text
    }
    
    mutating func getQuizProgress() -> Float {
        return Float(self.questionNumber + 1) / Float(self.quiz.count)
    }
}
