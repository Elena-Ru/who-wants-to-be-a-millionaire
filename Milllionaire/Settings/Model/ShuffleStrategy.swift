//
//  ShuffleStrategy.swift
//  Milllionaire
//
//  Created by Елена Русских on 28.11.2022.
//

import Foundation

protocol ShuffleStrategy {
    
    func shuffleQuestions (questions: [Question]) -> [Question]
}
