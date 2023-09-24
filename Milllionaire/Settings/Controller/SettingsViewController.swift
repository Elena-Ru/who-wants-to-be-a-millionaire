//
//  SettingsViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 28.11.2022.
//

import UIKit

class SettingsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
  
    var game = Game.shared
    private var rootView = SettingsRootView()
    private var router: SettingsRouter!
    private var selectedTheme = UserDefaults.standard.string(forKey: "selectedTheme") ?? "System"
    
    override func loadView() {
      super.loadView()
      view = rootView
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
    
      router = SettingsRouter(viewController: self)
      view.backgroundColor = UIColor(named: "background")
      self.title = Texts.settings
      let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
      navigationController?.navigationBar.titleTextAttributes = textAttributes
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: Texts.dismiss, style: .plain,  target: self, action: #selector(dismissSelf))
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
      if indexPath.section == 0 {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = Texts.shuffle
        cell.textLabel?.textColor = UIColor(named: "text")
        let shuffleSwitch = UISwitch()
        shuffleSwitch.isOn = setPosition()
        shuffleSwitch.addTarget(self, action: #selector(shuffleSwitchChanged(_:)), for:   .valueChanged)
    
        cell.accessoryView = shuffleSwitch
        cell.backgroundColor = UIColor(named: "secondaryBackground")
        return cell
      } else {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = "Color scheme"
        cell.textLabel?.textColor = UIColor(named: "text")
        cell.detailTextLabel?.text = selectedTheme
        cell.detailTextLabel?.textColor = UIColor(named: "text")
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(named: "secondaryBackground")
        return cell
      }
    }
  
    // MARK: - UITableViewDelegate
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if indexPath.section == 1 {
        tableView.deselectRow(at: indexPath, animated: true)
    
        let alertController = UIAlertController(title: nil, message: "Choose color scheme",   preferredStyle: .actionSheet)
    
        let themes = ["System", "Light", "Dark"]
        for theme in themes {
          let action = UIAlertAction(title: theme, style: .default) { [weak self] _ in
            self?.selectedTheme = theme
            UserDefaults.standard.set(self?.selectedTheme, forKey: "selectedTheme")
            UIApplication.shared.windows.first?.applyColorScheme(theme)
            tableView.reloadRows(at: [indexPath], with: .automatic)
          }
          alertController.addAction(action)
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
    
        present(alertController, animated: true, completion: nil)
      }
    }
  
  // MARK: - Actions
  
    @objc private func shuffleSwitchChanged(_ sender: UISwitch) {
      if (sender.isOn == true){
        game.selectedDifficulty = .medium
      } else {
        game.selectedDifficulty = .easy
      }
    }
    
    @objc private func dismissSelf() {
      router.closeSettings()
    }
}

fileprivate  func setPosition() -> Bool {
    if Game.shared.selectedDifficulty == .easy {
      return false
    } else {
      return true
    }
}
