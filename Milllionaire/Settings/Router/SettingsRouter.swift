//
//  SettingsRouter.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation

class SettingsRouter: BaseRouter<SettingsViewController> {
    func closeSettings() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
