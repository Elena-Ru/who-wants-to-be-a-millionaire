//
//  ResultsRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit


final class ResultsRootView: UIView {
  
  //MARK: Variables
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
    tableView.tableFooterView = UIView()
    tableView.backgroundColor = .clear
    return tableView
  }()
  
  //MARK: Inits
  init() {
    super.init(frame: CGRect())
    backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Private methods
  private func setupLayout() {
    self.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
      tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 12)
    ])
  }
  
}
