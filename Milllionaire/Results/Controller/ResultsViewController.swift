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
    private var router: ResultsRouter!
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        router = ResultsRouter(viewController: self)
        title = Texts.results
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Texts.dismiss, style: .plain, target: self, action: #selector(dismissSelf))
        view.backgroundColor = UIColor(named: "background")
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    @objc private func dismissSelf() {
        router.closeResults()
    }
}


extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else { return UITableViewCell()}
        
        cell.textLabel?.text = " Success % - \(results[indexPath.row].procent!), Qty of correct answers -\(results[indexPath.row].correctAnswerCount! )"
        return cell
    }
}

extension ResultsViewController: GameViewControllerDelegate {
    func didEndGame(withResult result: Results) {
        results.append(result)
        rootView.tableView.reloadData()
    }
}
