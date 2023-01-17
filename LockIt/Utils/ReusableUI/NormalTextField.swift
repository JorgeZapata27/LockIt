//
//  NormalTextField.swift
//  LockIt
//
//  Created by JZ M1 on 04.01.23.
//

import Foundation
import UIKit

class NormalTextField: UIView {
    
    // MARK: - UI Components
    let textField = TextField()
    
    // MARK: - View Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NormalTextField {
    
    func style() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    func layout() {
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leftAnchor.constraint(equalTo: leftAnchor),
            textField.rightAnchor.constraint(equalTo: rightAnchor),
            textField.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
}

extension NormalTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = yellowColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = secondaryTextColor?.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

