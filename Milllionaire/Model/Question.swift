//
//  Question.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import Foundation

struct Question {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let isCorrect: Bool
}
