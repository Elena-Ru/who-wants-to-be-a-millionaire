//
//  AppearenceManager.swift
//  Milllionaire
//
//  Created by Елена Русских on 24.05.2023.
//

import Foundation
import UIKit

final class AppearenceManager {
  class func setupAppearence(){
    let navbarAppearence = UINavigationBar.appearance(for: UITraitCollection(verticalSizeClass: .unspecified))
    let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: Constants.regularFontSize)]
    navbarAppearence.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    
    let navbarCompactAppearence = UINavigationBar.appearance(for: UITraitCollection(verticalSizeClass: .compact))
    navbarCompactAppearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: Constants.compactFontSize)!]
  }
}
