//
//  SettingsViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 28.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var game = Game.shared    
    var rootView = SettingsRootView()
    
    @objc private func shuffleAction(_ sender:UISwitch!) {
        if (sender.isOn == true){
            game.selectedDifficulty = .medium
        } else {
            game.selectedDifficulty = .easy
        }
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "background")
        title = Texts.settings
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Texts.dismiss, style: .plain, target: self, action: #selector(dismissSelf))
        rootView.shuffleSwitch.addTarget(self, action: #selector(shuffleAction), for: .valueChanged)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
}
