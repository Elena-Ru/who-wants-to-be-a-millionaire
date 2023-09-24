//
//  Results.swift
//  Milllionaire
//
//  Created by Елена Русских on 27.11.2022.
//

import Foundation

class Results: Codable {

    var procent: Double?
    var correctAnswerCount: Int?
    
    init(procent: Double? = nil, correctAnswerCount: Int? = nil) {
        self.procent = procent
        self.correctAnswerCount = correctAnswerCount
    }
}
