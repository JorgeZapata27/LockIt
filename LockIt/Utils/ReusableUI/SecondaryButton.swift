//
//  SecondaryButton.swift
//  LockIt
//
//  Created by JZ M1 on 14.02.23.
//

import Foundation
import UIKit

class SecondaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sharedLayout()
    }
    
    init(named title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: [])
        setTitleColor(normalTextColor, for: [])
        sharedLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        sharedLayout()
    }
    
    private func sharedLayout() {
        addTarget(self, action: #selector(hapticFeedback), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius = 8
        backgroundColor = .clear
        layer.borderColor = normalTextColor?.cgColor
        layer.borderWidth = 3
        setTitleColor(normalTextColor, for: [])
    }
    
    @objc func hapticFeedback() {
        Haptic().medium()
    }
    
}
