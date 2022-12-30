//
//  Preference.swift
//  LockIt
//
//  Created by JJ Zapata on 11/26/22.
//

import UIKit

class Preference: UIView {
    
    // MARK: - UI Components
    let preferenceTitle = UILabel()
    var preferenceSwitch: UISwitch?
    
    init(title: String, width: Int) {
        super.init(frame: .zero)
        
        style()
        layout(width: width)
        
        preferenceTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Preference {
    
    func style() {
        preferenceTitle.translatesAutoresizingMaskIntoConstraints = false
        preferenceTitle.textAlignment = .left
        preferenceTitle.font = .boldSystemFont(ofSize: 17)
        preferenceTitle.textColor = normalTextColor
    }
    
    func layout(width: Int) {
        addSubview(preferenceTitle)
        NSLayoutConstraint.activate([
            preferenceTitle.topAnchor.constraint(equalTo: topAnchor),
            preferenceTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 9),
            preferenceTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            preferenceTitle.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        print(width)
        preferenceSwitch = UISwitch(frame: CGRect(x: width - 50, y: 0, width: 0, height: 0))
        preferenceSwitch!.onTintColor = yellowColor
        preferenceSwitch!.isOn = true
        addSubview(preferenceSwitch!)
    }
    
}
