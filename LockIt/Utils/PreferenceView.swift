//
//  PreferenceView.swift
//  LockIt
//
//  Created by JJ Zapata on 11/26/22.
//

import UIKit

class PreferenceView: UIView {
    
    // MARK: - UI Components
    var hasNumbers: Preference?
    var hasLetters: Preference?
    var hasCharacters: Preference?
    
    init(width: Int) {
        super.init(frame: .zero)
        
        self.backgroundColor = secondaryBackgroundColor
        self.layer.cornerRadius = 8
        
        print("width: \(width)")
        
        let preferenceTitle = UILabel()
        hasNumbers = Preference(title: "Includes Numbers", width: width)
        hasLetters = Preference(title: "Includes Letters", width: width)
        hasCharacters = Preference(title: "Includes Special Characters", width: width)
        
        
        preferenceTitle.translatesAutoresizingMaskIntoConstraints = false
        preferenceTitle.textAlignment = .left
        preferenceTitle.text = "Preferences"
        preferenceTitle.textColor = secondaryTextColor
        preferenceTitle.font = .boldSystemFont(ofSize: 16)
        
        hasNumbers!.translatesAutoresizingMaskIntoConstraints = false
        
        hasLetters!.translatesAutoresizingMaskIntoConstraints = false
        
        hasCharacters!.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(preferenceTitle)
        NSLayoutConstraint.activate([
            preferenceTitle.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            preferenceTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 9),
            preferenceTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            preferenceTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        addSubview(hasNumbers!)
        NSLayoutConstraint.activate([
            hasNumbers!.topAnchor.constraint(equalTo: preferenceTitle.bottomAnchor, constant: 10),
            hasNumbers!.leftAnchor.constraint(equalTo: leftAnchor),
            hasNumbers!.rightAnchor.constraint(equalTo: rightAnchor),
            hasNumbers!.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        addSubview(hasLetters!)
        NSLayoutConstraint.activate([
            hasLetters!.topAnchor.constraint(equalTo: hasNumbers!.bottomAnchor, constant: 16),
            hasLetters!.leftAnchor.constraint(equalTo: leftAnchor),
            hasLetters!.rightAnchor.constraint(equalTo: rightAnchor),
            hasLetters!.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        addSubview(hasCharacters!)
        NSLayoutConstraint.activate([
            hasCharacters!.topAnchor.constraint(equalTo: hasLetters!.bottomAnchor, constant: 16),
            hasCharacters!.leftAnchor.constraint(equalTo: leftAnchor),
            hasCharacters!.rightAnchor.constraint(equalTo: rightAnchor),
            hasCharacters!.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
