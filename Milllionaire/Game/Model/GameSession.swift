//
//  GameSession.swift
//  Milllionaire
//
//  Created by Елена Русских on 27.11.2022.
//

import Foundation

class GameSession {
    var correctAnswer: Int
    var questionQuantity: Int
    var currentQuestionNumber = Observable<Int>(1)
    var procent = Observable<Double>(0)
    
    init(correctAnswer: Int = 0, questionQuantity: Int = 0) {
        self.correctAnswer = correctAnswer
        self.questionQuantity = questionQuantity
    }
}
