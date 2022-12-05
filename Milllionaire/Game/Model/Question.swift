//
//  Question.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var isCorrect: Bool
}
