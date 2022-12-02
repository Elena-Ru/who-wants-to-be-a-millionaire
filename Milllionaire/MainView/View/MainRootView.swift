//
//  MainRootView.swift
//  Milllionaire
//
//  Created by Елена Русских on 01.12.2022.
//

import UIKit

class MainRootView: UIView {
    
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
    
    let startButton: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = #colorLiteral(red: 0.2763207555, green: 0.1030554697, blue: 0.3165085614, alpha: 1)
        btn.setTitle("Start", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.yellow.cgColor
        btn.layer.borderWidth = 2.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
        
    let resultButton: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = #colorLiteral(red: 0.2763207555, green: 0.1030554697, blue: 0.3165085614, alpha: 1)
        btn.setTitle("Results", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 20
        btn.layer.borderColor = UIColor.yellow.cgColor
        btn.layer.borderWidth = 2.0
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
        
        NSLayoutConstraint.activate([
            controlsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7) ,
            controlsStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(logo)
        topImageContainerView.addSubview(settingsButton)
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
            settingsButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}
