//
//  SettingsViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 28.11.2022.
//

import UIKit


final class SettingsViewController: UIViewController, UIPopoverPresentationControllerDelegate {
  
  //MARK: Variables
  private var game = Game.shared
  private var rootView = SettingsRootView()
  
  //MARK: ObjC Methods
  @objc private func shuffleAction(_ sender:UISwitch!) {
    game.selectedDifficulty = sender.isOn ? .medium : .easy
  }
  
  @objc private func dismissSelf() {
    dismiss(animated: true)
  }
  
  //MARK: VC LifeCycle
  override func loadView() {
    super.loadView()
    view = rootView
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = Texts.SettingsVC.settings
    let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = textAttributes
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: Texts.Shared.dismiss,
                                                        style: .plain,
                                                        target: self,
                                                        action: #selector(dismissSelf))
    rootView.shuffleSwitch.addTarget(self, action: #selector(shuffleAction), for: .valueChanged)
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    rootView.setupFont(traitCollection: traitCollection)
    rootView.layoutTrait(traitCollection: traitCollection)
  }
}



