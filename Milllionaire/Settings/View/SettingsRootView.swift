//
//  SettingsRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit


class SettingsRootView : UIView {
    
    let shuffleLabel: UILabel = {
        let label = UILabel()
        label.text = "Do you what to shuffle questions?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var shuffleSwitch : UISwitch = {
        let switchV = UISwitch(frame: CGRect.zero)
        switchV.translatesAutoresizingMaskIntoConstraints = false
        setPosition(switchV)
        switchV.tintColor = .red
        switchV.onTintColor = .green
        switchV.layer.cornerRadius = switchV.frame.height / 2.0
        switchV.backgroundColor = .red
        switchV.clipsToBounds = true
        return switchV
    }()
    
     init() {
        super.init(frame: CGRect())
        creatView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func creatView() {
        setupLayout()
    }
    
    private func setupLayout() {
        let topContainerView = UIView()
        self.addSubview(topContainerView)
        topContainerView.addSubview(shuffleLabel)
        topContainerView.addSubview(shuffleSwitch)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topContainerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            topContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            topContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            
            shuffleLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 25),
            shuffleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 20),
            shuffleLabel.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.7) ,
            shuffleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            shuffleSwitch.centerYAnchor.constraint(equalTo: shuffleLabel.centerYAnchor),
            shuffleSwitch.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -40),
            shuffleSwitch.widthAnchor.constraint(equalToConstant: 50),
            shuffleSwitch.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
}

fileprivate  func setPosition(_ switchV: UISwitch) {
    if Game.shared.selectedDifficulty == .easy {
        switchV.setOn(false, animated: true)
    } else {
        switchV.setOn(true, animated: true)
    }
}
