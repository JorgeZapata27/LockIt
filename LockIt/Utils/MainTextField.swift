//
//  MainTextField.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import UIKit

class MainTextField: UIView {
    
    // MARK: - UI Components
    let titleLabel = UILabel()
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

extension MainTextField {
    
    func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = secondaryTextColor
        titleLabel.textAlignment = .left
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    }
    
    func layout() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textField.leftAnchor.constraint(equalTo: leftAnchor),
            textField.rightAnchor.constraint(equalTo: rightAnchor),
            textField.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
}

extension MainTextField: UITextFieldDelegate {
    
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
