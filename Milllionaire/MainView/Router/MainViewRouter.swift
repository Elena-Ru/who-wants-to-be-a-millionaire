//
//  MainViewRouter.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation
import UIKit

enum MainTransition {
    case game
    case results
    case setting
    case addNewQuestion
}

class MainRouter: BaseRouter<MainViewController> {
    private var gameController: GameViewController
    private var resultController: ResultsViewController

    init(viewController: MainViewController, gameController: GameViewController, resultController: ResultsViewController) {
        self.gameController = gameController
        self.resultController = resultController
        super.init(viewController: viewController)
    }
    
    func route(to transition: MainTransition) {
        let targetVC: UIViewController
        switch transition {
        case .game:
            targetVC = gameController
        case .results:
            targetVC = resultController
        case .setting:
            targetVC = SettingsViewController()
        case .addNewQuestion:
            targetVC = AddingQuestionViewController()
        }
        let navigationController = UINavigationController(rootViewController: targetVC)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true)
    }
}
