//
//  ViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit


final class MainViewController: UIViewController {
  
  //MARK: Variables
  private var gameController: GameViewController?
  private var resultController: ResultsViewController?
  private var rootView = MainRootView()
  
  //MARK: ObjC Methods
  @objc func settingsButtonAction(sender: UIButton!) {
    let vc = SettingsViewController()
    let settingsNavigationController = UINavigationController(rootViewController: vc)
    settingsNavigationController.modalPresentationStyle = .fullScreen
    present(settingsNavigationController, animated: true)
  }
  
  @objc func addNewQuestion(sender: UIButton!) {
    let vc = AddingQuestionViewController()
    let addingQuestionNavigationController = UINavigationController(rootViewController: vc)
    addingQuestionNavigationController.modalPresentationStyle = .fullScreen
    present(addingQuestionNavigationController, animated: true)
  }
  
  @objc func buttonAction(sender: UIButton!) {
    if let vc = gameController {
      vc.difficulty = Game.shared.selectedDifficulty
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true)
    }
  }
  
  @objc func resulButtonAction(sender: UIButton!) {
    let resultNavigationController = UINavigationController(rootViewController: resultController!)
    resultNavigationController.modalPresentationStyle = .fullScreen
    present(resultNavigationController, animated: true)
  }

  //MARK: VC LifeCycle
  override func loadView() {
    super.loadView()
    view = rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    gameController = GameViewController()
    resultController = ResultsViewController()
    gameController?.gameDelegate = resultController
    rootView.settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
    rootView.startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    rootView.resultButton.addTarget(self, action: #selector(resulButtonAction), for: .touchUpInside)
    rootView.addQuestionButton.addTarget(self, action: #selector(addNewQuestion), for: .touchUpInside)
    rootView.setupFont(traitCollection: traitCollection)
    rootView.layoutTrait(traitCollection: UIScreen.main.traitCollection)
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    rootView.setupFont(traitCollection: traitCollection)
    rootView.layoutTrait(traitCollection: traitCollection)
  }
}

