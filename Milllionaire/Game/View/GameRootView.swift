//
//  GameRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit

class GameRootView: UIView {
    
     var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
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
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = #colorLiteral(red: 0.2763207555, green: 0.1030554697, blue: 0.3165085614, alpha: 1)
        topImageContainerView.layer.cornerRadius = 30
        topImageContainerView.layer.borderWidth = 2
        topImageContainerView.layer.borderColor = UIColor.yellow.cgColor
        self.addSubview(topImageContainerView)
        topImageContainerView.addSubview(questionLabel)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            topImageContainerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topImageContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            topImageContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            
            questionLabel.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor, constant: 12),
            questionLabel.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor, constant: -12),
            
            
            tableView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 12)
            
        ])
    }
    
}
