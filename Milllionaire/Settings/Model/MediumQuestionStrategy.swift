//
//  ShuffleQuestionStrategy.swift
//  Milllionaire
//
//  Created by Елена Русских on 28.11.2022.
//

import Foundation

final class MediumQuestionStrategy: ShuffleStrategy {
    
    func shuffleQuestions(questions: [Question]) -> [Question] {
        let shuffledArray = questions.shuffled()
        return shuffledArray
    }
    
    
}
