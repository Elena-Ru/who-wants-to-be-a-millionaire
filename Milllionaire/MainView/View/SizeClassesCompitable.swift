//
//  SizeClassesCompitable.swift
//  Milllionaire
//
//  Created by Елена Русских on 21.05.2023.
//

import Foundation
import UIKit


protocol SizeClassesCompitable {
  var compactConstraints: [NSLayoutConstraint] {get set}
  var regularConstraints: [NSLayoutConstraint] {get set}
  var sharedConstraints: [NSLayoutConstraint] {get set}
  var ipadConstraints: [NSLayoutConstraint] {get set}
  func layoutTrait(traitCollection: UITraitCollection)
}

extension SizeClassesCompitable {  
  func layoutTrait(traitCollection: UITraitCollection) {
    if (!sharedConstraints[0].isActive) {
      NSLayoutConstraint.activate(sharedConstraints)
    }
    if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
      if regularConstraints.count > 0 && regularConstraints[0].isActive {
        NSLayoutConstraint.deactivate(regularConstraints)
      }
      NSLayoutConstraint.activate(compactConstraints)
    } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
      if regularConstraints.count > 0 && regularConstraints[0].isActive {
        NSLayoutConstraint.deactivate(regularConstraints)
      }
      NSLayoutConstraint.activate(regularConstraints)
      NSLayoutConstraint.activate(ipadConstraints)
    } else {
      if compactConstraints.count > 0 && compactConstraints[0].isActive {
        NSLayoutConstraint.deactivate(compactConstraints)
      }
      NSLayoutConstraint.activate(regularConstraints)
    }
  }
}
