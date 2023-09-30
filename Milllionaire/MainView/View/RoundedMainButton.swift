//
//  PurpleButton.swift
//  Milllionaire
//
//  Created by Елена Русских on 03.12.2022.
//

import UIKit

class RoundedMainButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
     init(title: String) {
        super.init(frame: .zero)
        layer.backgroundColor = R.color.accent()?.cgColor
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        layer.cornerRadius = 20
        layer.borderColor = R.color.darkOrange()?.cgColor
        layer.borderWidth = 2.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
