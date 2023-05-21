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
  static let shared = Game()
  
  var results : [Results] {
    didSet {
      resultsCaretaker.saveGame(self.results)
    }
  }
  
  private init(){
    self.results = self.resultsCaretaker.loadGame()
  }
  
  func corAnswerProcent (correctAnswerCount: Int, totalQuestionCount: Int) -> Double {
    Double(correctAnswerCount * 100 / totalQuestionCount)
  }
}
