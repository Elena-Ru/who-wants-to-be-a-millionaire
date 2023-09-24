//
//  AddQuestionRouter.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation

class AddQuestionRouter: BaseRouter<AddingQuestionViewController> {
    func closeAddQuestion() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
