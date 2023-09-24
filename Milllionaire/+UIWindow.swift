//
//  +UIApplication.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation
import UIKit

extension UIWindow {
    func applyColorScheme(_ scheme: String) {
        switch scheme {
        case "Light":
            overrideUserInterfaceStyle = .light
        case "Dark":
            overrideUserInterfaceStyle = .dark
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }
}
