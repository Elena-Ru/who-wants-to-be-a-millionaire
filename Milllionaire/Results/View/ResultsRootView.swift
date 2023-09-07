//
//  ResultsRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit
import SnapKit

final class ResultsRootView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    init() {
        super.init(frame: CGRect())
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(tableView)
      
        tableView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(self.snp.topMargin).offset(10)
          make.leading.equalTo(self.snp.leading)
          make.trailing.equalTo(self.snp.trailing)
          make.bottom.equalTo(self.snp.bottomMargin).offset(12)
        }
    }
}
