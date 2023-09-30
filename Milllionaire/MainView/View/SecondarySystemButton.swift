//
//  SecondarySystemButton.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation
import UIKit

class SecondarySystemButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(withImage systemName: String) {
      super.init(frame: .zero)
      setImage(UIImage(systemName: systemName), for: .normal)
      tintColor = R.color.systemButton() 
      contentHorizontalAlignment = .fill
      contentVerticalAlignment = .fill
      translatesAutoresizingMaskIntoConstraints = false
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
