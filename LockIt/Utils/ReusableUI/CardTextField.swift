//
//  CardTextField.swift
//  LockIt
//
//  Created by JZ M1 on 04.01.23.
//

import Foundation
import UIKit
import TextFieldFormatter

class CardTextField: UIView {
    
    // MARK: - UI Components
    let textField = TextFieldFormatter()
    
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

extension CardTextField {
    
    func style() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.pattern = "NNNN NNNN NNNN NNNN"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1.5
        textField.tintColor = yellowColor
        textField.textColor = normalTextColor
        textField.layer.borderColor = secondaryTextColor?.cgColor
        textField.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        textField.bounds.inset(by: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
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

extension CardTextField: UITextFieldDelegate {
    
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

