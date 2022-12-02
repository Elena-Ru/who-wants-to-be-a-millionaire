//
//  ViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var gameController: GameViewController?
    var resultController: ResultsViewController?
    
     var rootView = MainRootView()
    
    override func loadView() {
        
        super.loadView()
        view = rootView
    }
    
    @objc func settingsButtonAction(sender: UIButton!) {
        
          let vc = SettingsViewController()
          let settingsNavigationController = UINavigationController(rootViewController: vc)
          settingsNavigationController.modalPresentationStyle = .fullScreen
          present(settingsNavigationController, animated: true)
  
      }

    @objc func buttonAction(sender: UIButton!) {

        gameController?.difficulty = Game.shared.selectedDifficulty 
        self.present(gameController!, animated: true)

    }

    @objc func resulButtonAction(sender: UIButton!) {

        let resultNavigationController = UINavigationController(rootViewController: resultController!)
        resultNavigationController.modalPresentationStyle = .fullScreen
        present(resultNavigationController, animated: true)

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
        gameController = GameViewController()
        gameController!.modalPresentationStyle = .fullScreen
        resultController = ResultsViewController()
        gameController!.gameDelegate = resultController
        
        rootView.settingsButton.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        rootView.startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        rootView.resultButton.addTarget(self, action: #selector(resulButtonAction), for: .touchUpInside)
    }
}

