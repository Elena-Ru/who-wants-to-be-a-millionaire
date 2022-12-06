//
//  AddQuestionRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 03.12.2022.
//

import UIKit

class AddQuestionRootView: UIView {
    
    let tableView: UITableView = {
       let tableView = UITableView()
       tableView.translatesAutoresizingMaskIntoConstraints = false
       tableView.register(AddQuestionTableViewCell.self, forCellReuseIdentifier: AddQuestionTableViewCell.identifier)
       tableView.backgroundColor = #colorLiteral(red: 0.1470966935, green: 0.2613164783, blue: 0.4531337619, alpha: 1)
       return tableView
   }()

    let addButton: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.white.cgColor
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
       
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            topContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            topContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            topContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            topContainerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            
            tableView.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            addButton.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.5) ,
            addButton.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
}
