//
//  SettingsRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit
import SnapKit


final class SettingsRootView : UIView {
    
    let shuffleLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.shuffle
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var shuffleSwitch: CustomSwitch = {
        var isOn = setPosition()
        let switchV = CustomSwitch(isOn: isOn)
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
      
        topContainerView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(self.snp_topMargin)
          make.leading.equalTo(self.snp.leading)
          make.trailing.equalTo(self.snp.trailing)
          make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
        
        shuffleLabel.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topContainerView.snp.top).offset(25)
          make.leading.equalTo(topContainerView.snp.leading)  .offset(20)
          make.width.equalTo(topContainerView.snp.width)  .multipliedBy(0.7)
          make.height.equalTo(20)
        }
      
        shuffleSwitch.snp.makeConstraints { (make) -> Void in
        
          make.centerY.equalTo(shuffleLabel.snp.centerY)
          make.trailing.equalTo(topContainerView.snp.trailing)  .offset(-40)
          make.width.equalTo(50)
          make.height.equalTo(30)
        }
    }
}

fileprivate  func setPosition() -> Bool {
    if Game.shared.selectedDifficulty == .easy {
        return false
    } else {
        return true
    }
}
