//
//  ViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var gameController: GameViewController = {
        let controller = GameViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.gameDelegate = resultController
        return controller
    }()
    
    lazy var resultController: ResultsViewController = {
        ResultsViewController()
    }()
    
    var rootView = MainRootView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    // MARK: - Setup
  
    private func setupActions() {
        rootView.settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        rootView.startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        rootView.resultButton.addTarget(self, action: #selector(resultButtonAction), for: .touchUpInside)
        rootView.addQuestionButton.addTarget(self, action: #selector(addNewQuestionAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func settingsButtonAction(sender: UIButton!) {
        presentViewController(with: SettingsViewController())
    }
    
    @objc private func addNewQuestionAction(sender: UIButton!) {
        presentViewController(with: AddingQuestionViewController())
    }

    @objc private func startButtonAction(sender: UIButton!) {
        gameController.difficulty = Game.shared.selectedDifficulty
        present(gameController, animated: true)
    }

    @objc private func resultButtonAction(sender: UIButton!) {
        presentViewController(with: resultController)
    }
    
    // MARK: - Helper
    
    private func presentViewController<T: UIViewController>(with controller: T) {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
