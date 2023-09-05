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
        btn.tintColor = .white
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let startButton: PurpleButton = {
        let btn = PurpleButton(title: "Start")
        return btn
    }()
        
    let resultButton: PurpleButton = {
        let btn = PurpleButton(title: "Results")
        return btn
    }()
    
    let addQuestionButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.tintColor = .white
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
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            logo.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            logo.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5),
            logo.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            settingsButton.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 50),
            settingsButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            settingsButton.widthAnchor.constraint(equalToConstant: 40),
            settingsButton.heightAnchor.constraint(equalToConstant: 40),
            
            addQuestionButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 25),
            addQuestionButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            addQuestionButton.widthAnchor.constraint(equalToConstant: 40),
            addQuestionButton.heightAnchor.constraint(equalToConstant: 40)
            
            ])
    }
}
