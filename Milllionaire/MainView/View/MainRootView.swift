//
//  MainRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit

final class MainRootView: UIView, SizeClassesCompitable {
  
  //MARK: Variables
  private let logo : UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "MilllionaireLogo"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let topImageContainerView : UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var controlsStackView = UIStackView()
  var compactConstraints: [NSLayoutConstraint] = []
  var regularConstraints: [NSLayoutConstraint] = []
  var sharedConstraints: [NSLayoutConstraint] = []
  var ipadConstraints: [NSLayoutConstraint] = []
  
  let settingsButton: WhiteSymbolButton = {
    let btn = WhiteSymbolButton(img: "gear")
    return btn
  }()
  
  lazy var startButton: PurpleButton = {
    let btn = PurpleButton(title: Texts.MainVC.start)
    return btn
  }()
  
  lazy var resultButton: PurpleButton = {
    let btn = PurpleButton(title: Texts.MainVC.results)
    return btn
  }()
  
  let addQuestionButton: WhiteSymbolButton = {
    let btn = WhiteSymbolButton(img: "plus.circle")
    return btn
  }()
  
  //MARK: Inits
  init() {
    super.init(frame: CGRect())
    setupUI()
    setupButtons()
    setupConstraints()
    NSLayoutConstraint.activate(sharedConstraints)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Private Methods
  private func setupButtons() {
    controlsStackView = UIStackView(arrangedSubviews: [startButton, resultButton])
    controlsStackView.translatesAutoresizingMaskIntoConstraints = false
    controlsStackView.distribution = .fillEqually
    controlsStackView.setCustomSpacing(Constants.spaceBtwVStack, after: startButton)
    controlsStackView.setCustomSpacing(Constants.spaceBtwVStack, after: resultButton)
    controlsStackView.axis = .vertical
    
    addSubview(controlsStackView)
  }
  
  private func setupUI() {
    addSubview(topImageContainerView)
    topImageContainerView.addSubview(logo)
    topImageContainerView.addSubview(settingsButton)
    topImageContainerView.addSubview(addQuestionButton)
  }
  
  private func setupConstraints() {
    setupSharedConstraints()
    setupIPadCostaints()
    setupRegularCostaints()
    setupCompactCostaints()
  }
  
  private func setupSharedConstraints() {
    sharedConstraints.append(contentsOf: [
      topImageContainerView.topAnchor.constraint(equalTo: self.topAnchor),
      topImageContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      topImageContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      topImageContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Constants.mediumMultiplyer),
      
      logo.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
      logo.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
      logo.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: Constants.mediumMultiplyer),
      logo.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: Constants.mediumMultiplyer),
      
      settingsButton.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: Constants.topLogoSpace),
      settingsButton.widthAnchor.constraint(equalToConstant: Constants.symbolBtnSize),
      settingsButton.heightAnchor.constraint(equalToConstant: Constants.symbolBtnSize),
      
      addQuestionButton.widthAnchor.constraint(equalToConstant: Constants.symbolBtnSize),
      addQuestionButton.heightAnchor.constraint(equalToConstant: Constants.symbolBtnSize),
      
      controlsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
  }
  
  private func setLowPriorityConstraint() -> NSLayoutConstraint {
    let lowConst = controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: Constants.ctrlStackBottom)
    lowConst.priority = .defaultLow
    return lowConst
  }
  
  private func setLowPriorityWidthConstraint() -> NSLayoutConstraint {
    let lowConstW = controlsStackView.heightAnchor.constraint(equalToConstant: Constants.smallButtonHeight)
    lowConstW.priority = .defaultLow
    return lowConstW
  }
  
  private func setupIPadCostaints() {
    ipadConstraints.append(contentsOf: [
      controlsStackView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: Constants.bigButtonHeight),
      controlsStackView.heightAnchor.constraint(equalToConstant: Constants.bigButtonHeight)
    ])
  }
  
  private func setupRegularCostaints() {
    regularConstraints.append(contentsOf: [
      settingsButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Constants.symbolButtonHorizontalFarInsets),
      addQuestionButton.topAnchor.constraint(equalTo: settingsButton.topAnchor),
      addQuestionButton.leadingAnchor.constraint(equalTo: settingsButton.trailingAnchor, constant: Constants.symbolButtonVerticalInsets),
      
      controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.mediumMultiplyer),
      setLowPriorityConstraint(),
      setLowPriorityWidthConstraint()
    ])
  }
  
  private func setupCompactCostaints() {
    compactConstraints.append(contentsOf: [
      settingsButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Constants.symbolButtonHorizontalInsets),
      addQuestionButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: Constants.symbolButtonVerticalInsets),
      addQuestionButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Constants.symbolButtonHorizontalInsets),
      
      controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: Constants.ctrlStackBottom),
      controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.highMultiplyer),
      controlsStackView.heightAnchor.constraint(equalToConstant: Constants.smallButtonHeight)
    ])
  }
}
