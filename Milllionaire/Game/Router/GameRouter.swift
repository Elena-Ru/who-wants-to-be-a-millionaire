//
//  GameRouter.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import UIKit

class GameRouter: BaseRouter<GameViewController> {
    func closeGame() {
        viewController?.dismiss(animated: true, completion: nil)
    }

    func presentAlert(title: String, message: String, completionHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Texts.ok, style: .cancel, handler: { action in
            completionHandler?()
            alert.dismiss(animated: true, completion: nil)
        }))
        viewController?.present(alert, animated: true)
    }
}

