//
//  ViewController.swift
//  Milllionaire
//
//  Created by Елена Русских on 26.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var gameController: GameViewController?
    var resultController: ResultsViewController?
    
    let logo : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "MilllionaireLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func buttonAction(sender: UIButton!) {
    
        self.present(gameController!, animated: true)
      
    }
    
    
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
        btn.addTarget(self, action: #selector(resulButtonAction), for: .touchUpInside)
        return btn
    }()
    
    @objc func resulButtonAction(sender: UIButton!) {
        
        let resultNavigationController = UINavigationController(rootViewController: resultController!)
        resultNavigationController.modalPresentationStyle = .fullScreen
        present(resultNavigationController, animated: true)
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1924170554, green: 0.0007362262113, blue: 0.3723829389, alpha: 1)
        setupLayout()
        setupButtons()
        gameController = GameViewController()
        gameController!.modalPresentationStyle = .fullScreen
        
        resultController = ResultsViewController()
        gameController!.gameDelegate = resultController
    }
    
    private func setupButtons() {
        
        let controlsStackView = UIStackView(arrangedSubviews: [startButton, resultButton])
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.distribution = .fillEqually
        controlsStackView.setCustomSpacing(20, after: startButton)
        controlsStackView.setCustomSpacing(20, after: resultButton)
        controlsStackView.axis = .vertical
        
        view.addSubview(controlsStackView)
        
        NSLayoutConstraint.activate([
            controlsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            controlsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7) ,
            controlsStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(logo)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            logo.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            logo.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5),
            logo.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
        ])
    }
}

