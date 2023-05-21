//
//  GameViewControllerDelegate.swift
//  Milllionaire
//
//  Created by Елена Русских on 21.05.2023.
//

import Foundation


protocol GameViewControllerDelegate: AnyObject {
  func didEndGame (withResult result: Results)
}
