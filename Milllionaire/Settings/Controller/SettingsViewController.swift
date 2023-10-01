//
//  SettingsViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 28.11.2022.
//

import UIKit
import RswiftResources

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var game = Game.shared
    private var rootView = SettingsRootView()
    private var router: SettingsRouter!
    private var selectedTheme = UserDefaults.standard.string(forKey: "selectedTheme") ?? R.string.localizable.system()
    
    override func loadView() {
      super.loadView()
      view = rootView
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
    
      router = SettingsRouter(viewController: self)
      view.backgroundColor = R.color.background()
      self.title = R.string.localizable.settings()
      let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
      navigationController?.navigationBar.titleTextAttributes = textAttributes
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.dismiss(), style: .plain, target: self, action: #selector(dismissSelf))
      rootView.tableView.dataSource = self
      rootView.tableView.delegate = self
    }
  
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.section == 0 {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = R.string.localizable.shuffleQuestions()
        cell.textLabel?.textColor = R.color.text()
        let shuffleSwitch = UISwitch()
        shuffleSwitch.isOn = setPosition()
        shuffleSwitch.addTarget(self, action: #selector(shuffleSwitchChanged(_:)), for: .valueChanged)
    
        cell.accessoryView = shuffleSwitch
        cell.backgroundColor = R.color.secondaryBackground()
        return cell
      } else {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = R.string.localizable.colorScheme()
        cell.textLabel?.textColor = R.color.text()
        cell.detailTextLabel?.text = selectedTheme
        cell.detailTextLabel?.textColor = R.color.text()
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = R.color.secondaryBackground()
        return cell
      }
    }
  
    // MARK: - UITableViewDelegate
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if indexPath.section == 1 {
        tableView.deselectRow(at: indexPath, animated: true)
    
        let alertController = UIAlertController(title: nil, message: R.string.localizable.chooseScheme(), preferredStyle: .actionSheet)
    
        let themes = [R.string.localizable.system(), R.string.localizable.light(), R.string.localizable.dark()]
        for theme in themes {
          let action = UIAlertAction(title: theme, style: .default) { [weak self] _ in
            self?.selectedTheme = theme
            UserDefaults.standard.set(self?.selectedTheme, forKey: "selectedTheme")
            UIApplication.shared.windows.first?.applyColorScheme(theme)
            tableView.reloadRows(at: [indexPath], with: .automatic)
          }
          alertController.addAction(action)
        }
    
        let cancelAction = UIAlertAction(title: R.string.localizable.cancel(), style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
    
        present(alertController, animated: true, completion: nil)
      }
    }
  
    private func setPosition() -> Bool {
      if Game.shared.selectedDifficulty == .easy {
        return false
      } else {
        return true
      }
    }
  // MARK: - Actions
  
    @objc private func shuffleSwitchChanged(_ sender: UISwitch) {
      if sender.isOn == true {
        game.selectedDifficulty = .medium
      } else {
        game.selectedDifficulty = .easy
      }
    }
    
    @objc private func dismissSelf() {
      router.closeSettings()
    }
}
