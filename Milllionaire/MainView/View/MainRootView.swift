//
//  MainRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit
import SnapKit
import RswiftResources

final class MainRootView: UIView {
    // MARK: - Constatnts
    private enum Constants {
        static let logoFontSize: CGFloat = 46
        static let spacingBetweenButtons: CGFloat = 20
        static let bottomSpace: CGFloat = -40
        static let heightControlStack: CGFloat = 100
        static let heightSystemButton: CGFloat = 40
        static let topInsets: CGFloat = 50
        static let trailingInsets: CGFloat = -30
        static let systemButtonsInsets: CGFloat = 25
        static let halfMultiplier: CGFloat = 0.5
        static let widthButtonMultiplier: CGFloat = 0.6
    }
    // MARK: - UI elemants
    let logo: UILabel = {
        let label = UILabel()
        label.text = Texts.appName
        label.textColor = R.color.title()
        label.font = UIFont.systemFont(ofSize: Constants.logoFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: RoundedMainButton = {
        RoundedMainButton(title: Texts.start)
    }()
        
    let resultButton: RoundedMainButton = {
        RoundedMainButton(title: Texts.results)
    }()
    
    let settingsButton: SecondarySystemButton = {
      SecondarySystemButton(withImage: "gear")
    }()
    
    let addQuestionButton: SecondarySystemButton = {
      SecondarySystemButton(withImage: "plus.circle")
    }()
    // MARK: - Inits
    init() {
        super.init(frame: CGRect())
        
        creatView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private methods
    private func creatView() {
        setupButtons()
        setupLayout()
    }
    
    private func setupButtons() {
        
        let controlsStackView = UIStackView(arrangedSubviews: [startButton, resultButton])
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.distribution = .fillEqually
        controlsStackView.setCustomSpacing(Constants.spacingBetweenButtons, after: startButton)
        controlsStackView.setCustomSpacing(Constants.spacingBetweenButtons, after: resultButton)
        controlsStackView.axis = .vertical
        
        addSubview(controlsStackView)
      
        controlsStackView.snp.makeConstraints { (make) -> Void in
        
          make.centerX.equalTo(self.snp.centerX)
          make.bottom.equalTo(self.snp_bottomMargin).offset(Constants.bottomSpace)
          make.width.equalTo(self.snp.width).multipliedBy(Constants.widthButtonMultiplier)
          make.height.equalTo(Constants.heightControlStack)
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
          make.height.equalTo(self.snp.height).multipliedBy(Constants.halfMultiplier)
        }
        
        logo.snp.makeConstraints { (make) -> Void in
        
          make.center.equalTo(topImageContainerView.snp.center)
        }
        
        settingsButton.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(topImageContainerView.snp.top).offset(Constants.topInsets)
          make.trailing.equalTo(self.snp_trailingMargin).offset(Constants.trailingInsets)
          make.width.height.equalTo(Constants.heightSystemButton)
        }
        
        addQuestionButton.snp.makeConstraints { (make) -> Void in
        
          make.top.equalTo(settingsButton.snp.bottom).offset(Constants.systemButtonsInsets)
          make.trailing.equalTo(self.snp_trailingMargin).offset(Constants.trailingInsets)
          make.width.height.equalTo(Constants.heightSystemButton)
        }
    }
}
