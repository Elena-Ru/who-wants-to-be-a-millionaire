//
//  AnswerTextField.swift
//  Milllionaire
//
//  Created by Елена Русских on 03.12.2022.
//

import UIKit

class AnswerTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame) 
    }
    
    init(title: String) {
        super.init(frame: .zero)
        placeholder = title
        font = UIFont.systemFont(ofSize: 17)
        borderStyle = .roundedRect
        autocorrectionType = UITextAutocorrectionType.no
        keyboardType = UIKeyboardType.default
        returnKeyType = UIReturnKeyType.done
        clearButtonMode = UITextField.ViewMode.whileEditing
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
