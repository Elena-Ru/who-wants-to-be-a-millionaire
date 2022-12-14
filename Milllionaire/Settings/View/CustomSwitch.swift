//
//  CustomSwitch.swift
//  Milllionaire
//
//  Created by Елена Русских on 03.12.2022.
//

import UIKit

class CustomSwitch: UISwitch {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(isOn: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setOn(isOn, animated: true)
        tintColor = .red
        onTintColor = .green
        layer.cornerRadius = 15
        backgroundColor = .red
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
