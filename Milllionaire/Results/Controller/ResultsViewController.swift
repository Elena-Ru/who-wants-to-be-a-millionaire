//
//  ResultsViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit


final class ResultsViewController: UIViewController {
  
  //MARK: Variables
  var currentResults = Game.shared
  var results = Game.shared.results
  private var rootView = ResultsRootView()
  
  //MARK: ObjC func
  @objc private func dismissSelf() {
    dismiss(animated: true)
  }
  
  //MARK: LifeCycle
  override func loadView() {
    super.loadView()
    view = rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = Texts.Results.results
//    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//    navigationController?.navigationBar.titleTextAttributes = textAttributes
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: Texts.Shared.dismiss, style: .plain, target: self, action: #selector(dismissSelf))
    rootView.tableView.delegate = self
    rootView.tableView.dataSource = self
  }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    results.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard  let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell()}
    let count = results[indexPath.row].correctAnswerCount!
    let countString = Texts.qtnQtyFormated(count: count)
    if let localNum = results[indexPath.row].procent?.formatted(.percent) {
      cell.textLabel?.text = " \(Texts.Results.success) - \(String(describing: localNum)), \n \(Texts.Results.correctAnswersQty) \(countString)."
      cell.textLabel?.adjustsFontSizeToFitWidth = true
      cell.textLabel?.font = UIFont.systemFont(ofSize: Constants.regularFontSize)
      cell.textLabel?.minimumScaleFactor = 0.6
      cell.textLabel?.numberOfLines = 0
      cell.textLabel?.lineBreakMode = .byWordWrapping
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
