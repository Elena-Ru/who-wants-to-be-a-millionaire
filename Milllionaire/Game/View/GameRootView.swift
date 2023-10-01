//
//  GameRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit
import SnapKit
import RswiftResources

final class GameRootView: UIView {
    
    var questionNumberLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = 0
       label.textColor = R.color.title()
       label.font = UIFont.boldSystemFont(ofSize: 16)
       label.textAlignment = .center
       return label
   }()
    
    var correctAnswerProcentLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = 0
       label.textColor = R.color.title()
       label.font = UIFont.boldSystemFont(ofSize: 16)
       label.textAlignment = .center
       return label
   }()
    
     var questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = R.color.title()
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
        tableView.contentInset = .zero
        tableView.layer.cornerRadius = 20.0
        tableView.clipsToBounds = true
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
        
        let topLabelContainerView = UIView()
        topLabelContainerView.backgroundColor = R.color.accent()
        topLabelContainerView.layer.cornerRadius = 30
        topLabelContainerView.layer.borderWidth = 2
        topLabelContainerView.layer.borderColor = R.color.darkOrange()?.cgColor
        topLabelContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topLabelContainerView)
        topLabelContainerView.addSubview(questionNumberLabel)
        topLabelContainerView.addSubview(correctAnswerProcentLabel)
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = R.color.secondaryBackground()
        topImageContainerView.layer.cornerRadius = 30
        topImageContainerView.layer.borderWidth = 2
        self.addSubview(topImageContainerView)
        topImageContainerView.addSubview(questionLabel)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
      
        topLabelContainerView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
          make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
          make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
          make.height.equalTo(55)
        }
      
        questionNumberLabel.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topLabelContainerView.snp.top).offset(5)
          make.leading.equalTo(topLabelContainerView.snp.leading)
          make.trailing.equalTo(topLabelContainerView.snp.trailing)
          make.height.equalTo(20)
        }
      
        correctAnswerProcentLabel.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(questionNumberLabel.snp.bottom).offset(5)
          make.leading.equalTo(topLabelContainerView.snp.leading)
          make.trailing.equalTo(topLabelContainerView.snp.trailing)
          make.bottom.equalTo(topLabelContainerView.snp.bottom).offset(-5)
        }
      
        topImageContainerView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topLabelContainerView.snp.bottom).offset(15)
          make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
          make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
          make.height.equalTo(self.snp.height).multipliedBy(0.3)
        }
      
        questionLabel.snp.makeConstraints { (make) -> Void in
        
          make.center.equalTo(topImageContainerView.snp.center)
          make.leading.equalTo(topImageContainerView.snp.leading).offset(12)
          make.trailing.equalTo(topImageContainerView.snp.trailing).offset(-12)
        }
      
        tableView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topImageContainerView.snp.bottom).offset(40)
          make.leading.equalTo(topImageContainerView.snp.leading)
          make.trailing.equalTo(topImageContainerView.snp.trailing)
          make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
    }
}
