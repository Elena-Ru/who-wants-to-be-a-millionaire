//
//  AddQuestionRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 03.12.2022.
//

import UIKit
import SnapKit
import RswiftResources

final class AddQuestionRootView: UIView {
    
    let tableView: UITableView = {
       let tableView = UITableView()
       tableView.translatesAutoresizingMaskIntoConstraints = false
       tableView.register(AddQuestionTableViewCell.self, forCellReuseIdentifier: AddQuestionTableViewCell.identifier)
       tableView.backgroundColor = R.color.secondaryBackground()
       return tableView
   }()

    let addButton: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = R.color.accent()?.cgColor
        btn.setTitle(R.string.localizable.add(), for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = R.color.darkOrange()?.cgColor
        btn.layer.borderWidth = 2.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    init() {
       super.init(frame: CGRect())
        setupLayout()
   }

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    private func setupLayout() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        let topContainerView = UIView()
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(topContainerView)
        topContainerView.addSubview(tableView)
        scrollView.addSubview(addButton)
      
        scrollView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
          make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
          make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading)
          make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing)
        }
        
        topContainerView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(scrollView.snp.top).offset(5)
          make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-60)
          make.leading.equalTo(scrollView.snp.leading).offset(15)
          make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-15)
        }
      
        tableView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topContainerView.snp.top).offset(10)
          make.bottom.equalTo(topContainerView.snp.bottom)
          make.leading.equalTo(topContainerView.snp.leading)
          make.trailing.equalTo(topContainerView.snp.trailing)
        }
      
        addButton.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topContainerView.snp.bottom).offset(20)
          make.centerX.equalTo(topContainerView.snp.centerX)
          make.width.equalTo(topContainerView.snp.width).multipliedBy(0.5)
          make.height.equalTo(35)
        }
    }
}
