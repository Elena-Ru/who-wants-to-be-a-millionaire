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
        alert.addAction(UIAlertAction(title: R.string.localizable.ok(), style: .cancel, handler: { _ in
            completionHandler?()
            alert.dismiss(animated: true, completion: nil)
        }))
        viewController?.present(alert, animated: true)
    }
}
