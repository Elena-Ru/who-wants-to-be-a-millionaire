//
//  ResultsViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit

class ResultsViewController: UIViewController {
  
  var currentResults = Game.shared
  var results = Game.shared.results
  var rootView = ResultsRootView()
  
  override func loadView() {
    super.loadView()
    view = rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Results"
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = textAttributes
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissSelf))
    view.backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
    rootView.tableView.delegate = self
    rootView.tableView.dataSource = self
  }
  
  @objc private func dismissSelf() {
    dismiss(animated: true)
  }
}


extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    results.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard  let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell()}
    let count = results[indexPath.row].correctAnswerCount!
    let countString = String.localizedStringWithFormat(Texts.Results.format, count)
    if let localNum = results[indexPath.row].procent?.formatted(.percent) {
      cell.textLabel?.text = " Success - \(String(describing: localNum)), \(Texts.Results.correctAnswersQty) \(countString)"
    }
    return cell
  }
}

extension ResultsViewController: GameViewControllerDelegate {
  func didEndGame(withResult result: Results) {
    results.append(result)
    rootView.tableView.reloadData()
  }
}
