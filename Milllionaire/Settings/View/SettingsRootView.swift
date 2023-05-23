//
//  SettingsRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit


final class SettingsRootView : UIView, SizeClassesCompitable {
  
  //MARK: Variables
  private let shuffleLabel: UILabel = {
    let label = UILabel()
    label.text = Texts.SettingsVC.shuffle
    label.textColor = .white
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.textAlignment = .natural
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var shuffleSwitch: CustomSwitch = {
    var isOn = setPosition()
    let switchV = CustomSwitch(isOn: isOn)
    return switchV
  }()
  
  private let topContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var compactConstraints: [NSLayoutConstraint] = []
  var regularConstraints: [NSLayoutConstraint] = []
  var sharedConstraints: [NSLayoutConstraint] = []
  var ipadConstraints: [NSLayoutConstraint] = []
  
  //MARK: Inits
  init() {
    super.init(frame: CGRect())
    backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
    creatView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Private methods
  private func creatView() {
    setupUI()
    setupFont(traitCollection: traitCollection)
    setupConstraints()
    layoutTrait(traitCollection: traitCollection)
  }
  
  private func setupUI() {
    addSubview(topContainerView)
    topContainerView.addSubview(shuffleLabel)
    topContainerView.addSubview(shuffleSwitch)
  }
  
  private func setupConstraints() {
    setupSharedConstraints()
    setupRegularCostaints()
    setupCompactCostaints()
  }
  
  private func setupSharedConstraints() {
    sharedConstraints.append(contentsOf: [
      topContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      topContainerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
      topContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
      topContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
      
      shuffleLabel.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 25),
      shuffleLabel.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.7) ,
      shuffleLabel.heightAnchor.constraint(equalToConstant: 60),
      
      shuffleSwitch.centerYAnchor.constraint(equalTo: shuffleLabel.centerYAnchor),
      shuffleSwitch.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -40),
      shuffleSwitch.widthAnchor.constraint(equalToConstant: 50),
      shuffleSwitch.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func setupRegularCostaints() {
    regularConstraints.append(contentsOf: [
      shuffleLabel.trailingAnchor.constraint(equalTo: shuffleSwitch.leadingAnchor, constant: 20)
    ])
  }
  
  private func setupCompactCostaints() {
    compactConstraints.append(contentsOf: [
      shuffleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 20)
    ])
  }
  
  func setupFont(traitCollection: UITraitCollection) {
    switch traitCollection.horizontalSizeClass {
    case .compact:
      shuffleLabel.font = UIFont.systemFont(ofSize: Constants.compactFontSize)
    case .regular:
      shuffleLabel.font = UIFont.systemFont(ofSize: Constants.regularFontSize)
    case .unspecified:
      break
    @unknown default:
      fatalError()
    }
  }
}

fileprivate  func setPosition() -> Bool {
  Game.shared.selectedDifficulty == .easy ? false : true
}
