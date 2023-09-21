//
//  MainRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit
import SnapKit


final class MainRootView: UIView {
    
    let logo : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "MilllionaireLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let settingsButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "gear"), for: .normal)
        btn.tintColor = .deepPurple
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let startButton: StartButton = {
        let btn = StartButton(title: "Start")
        return btn
    }()
        
    let resultButton: ResultsButton = {
        let btn = ResultsButton(title: "Results")
        return btn
    }()
    
    let addQuestionButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.tintColor = .deepPurple
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    init() {
        super.init(frame: CGRect())
        
        creatView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func creatView() {
        setupButtons()
        setupLayout()
    }
    
    private func setupButtons() {
        
        let controlsStackView = UIStackView(arrangedSubviews: [startButton, resultButton])
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.distribution = .fillEqually
        controlsStackView.setCustomSpacing(20, after: startButton)
        controlsStackView.setCustomSpacing(20, after: resultButton)
        controlsStackView.axis = .vertical
        
        addSubview(controlsStackView)
      
        controlsStackView.snp.makeConstraints { (make) -> Void in
        
          make.centerX.equalTo(self.snp.centerX)
          make.bottom.equalTo(self.snp_bottomMargin).offset(-40)
          make.width.equalTo(self.snp.width).multipliedBy(0.6)
          make.height.equalTo(100)
        }
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(logo)
        topImageContainerView.addSubview(settingsButton)
        topImageContainerView.addSubview(addQuestionButton)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
      
        topImageContainerView.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(self.snp_topMargin)
          make.leading.equalTo(self.snp_leadingMargin)
          make.trailing.equalTo(self.snp_trailingMargin)
          make.height.equalTo(self.snp.height).multipliedBy(0.5)
        }
        
        logo.snp.makeConstraints { (make) -> Void in
        
          make.center.equalTo(topImageContainerView.snp.center)
          make.width.equalTo(topImageContainerView.snp.width).multipliedBy(0.5)
          make.height.equalTo(topImageContainerView.snp.height).multipliedBy(0.5)
        }
        
        settingsButton.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topImageContainerView.snp.top).offset(50)
          make.trailing.equalTo(self.snp_trailingMargin).offset(-30)
          make.width.height.equalTo(40)
        }
        
        addQuestionButton.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(settingsButton.snp.bottom).offset(25)
          make.trailing.equalTo(self.snp_trailingMargin).offset(-30)
          make.width.height.equalTo(40)
        }
    }
}
