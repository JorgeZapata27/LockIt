//
//  TextField.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import Foundation
import UIKit

class TextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)) {
        self.insets = inset
        super.init(frame: .zero)
        self.borderStyle = .roundedRect
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1.5
        self.tintColor = yellowColor
        self.textColor = normalTextColor
        self.layer.borderColor = secondaryTextColor?.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
}
