//
//  LocalizationKeys.swift
//  Milllionaire
//
//  Created by Елена Русских on 20.05.2023.
//

import Foundation

enum Texts {
  enum Results {
    static var correctAnswersQty: String { NSLocalizedString("QtyCorrectAnswers", comment: "") }
    static var format: String { NSLocalizedString("QtnQty", comment: "Qty of correct anwers") }
  }
  enum MainVC {
    static var start: String { NSLocalizedString("Start", comment: "Start Game") }
    static var results: String { NSLocalizedString("Results", comment: "Game results") }
  }
  enum SettingsVC {
    static var settings: String { NSLocalizedString("Settings", comment: "Game settings") }
    static var shuffle: String { NSLocalizedString("Shuffle", comment: "Shuffle questions in game") }
  }
  enum Shared {
    static var dismiss: String { NSLocalizedString("Dismiss", comment: "") }
  }
}
