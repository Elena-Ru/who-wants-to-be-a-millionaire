//
//  ResultsRouter.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation

class ResultsRouter: BaseRouter<ResultsViewController> {
    func closeResults() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
