//
//  PurpleButton.swift
//  Milllionaire
//
//  Created by Елена Русских on 03.12.2022.
//

import UIKit

class RoundedButton: UIButton {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
     init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        layer.cornerRadius = 20
        layer.borderWidth = 2.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StartButton: RoundedButton {
  
    override init(title: String) {
        super.init(title: title)
        layer.backgroundColor = UIColor.deepPurple.cgColor
        setTitleColor(UIColor.shinySilver, for: .normal)
        layer.borderColor = UIColor.softSilver.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
