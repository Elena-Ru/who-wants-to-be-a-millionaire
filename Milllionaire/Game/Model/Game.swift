//
//  Game.swift
//  Milllionaire
//
//  Created by Елена Русских on 27.11.2022.
//

import Foundation

class Game {
    
    private let resultsCaretaker = GameCaretaker()
    
    var session: GameSession?
    
    var selectedDifficulty: Difficulty = .easy
    
    func corAnswerProcent (correctAnswerCount: Int, totalQuestionCount: Int) -> Double {
        return Double(correctAnswerCount * 100 / totalQuestionCount)
    }
    
   var results : [Results] {
        didSet {
            resultsCaretaker.saveGame(self.results)
        }
    }
    
    static let shared = Game()
    
    private init(){
        self.results = self.resultsCaretaker.loadGame()
    }
}
