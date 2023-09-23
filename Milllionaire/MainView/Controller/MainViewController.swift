//
//  ViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var router: MainRouter!
  
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
        router = MainRouter(viewController: self, gameController: gameController, resultController: resultController)
        setupView()
        setupActions()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "background")
    }
    
    private func setupActions() {
        rootView.settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        rootView.startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        rootView.resultButton.addTarget(self, action: #selector(resultButtonAction), for: .touchUpInside)
        rootView.addQuestionButton.addTarget(self, action: #selector(addNewQuestionAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func settingsButtonAction(sender: UIButton!) {
        router.route(to: .setting)
    }
    
    @objc private func addNewQuestionAction(sender: UIButton!) {
        router.route(to: .addNewQuestion)
    }

    @objc private func startButtonAction(sender: UIButton!) {
        gameController.difficulty = Game.shared.selectedDifficulty
        router.route(to: .game)
    }

    @objc private func resultButtonAction(sender: UIButton!) {
        router.route(to: .results)
        
    }
}
