//
//  WhiteSymbolButton.swift
//  Milllionaire
//
//  Created by Елена Русских on 21.05.2023.
//

import Foundation
import UIKit

final class WhiteSymbolButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  init(img: String) {
    super.init(frame: .zero)
    setImage(UIImage(systemName: img), for: .normal)
    tintColor = .white
    contentHorizontalAlignment = .fill
    contentVerticalAlignment = .fill
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
