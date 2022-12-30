//
//  BiometricsEntry.swift
//  LockIt
//
//  Created by JJ Zapata on 11/25/22.
//

import Foundation
import UIKit

class BiometricsEntry: UIViewController {
    
    // MARK: - UI Components
    let appIcon = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let signOutButton = MainButton(named: "Sign In")
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension BiometricsEntry {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        
        Biometrics().securityCheck { success, errorMessage in
            if success {
                self.goToTabbar()
            } else {
                self.showErrorAlert(withTitle: "Error", withDescription: errorMessage)
            }
        }
    }
    
    // MARK: - Styling
    func style() {
        // App Icon
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        appIcon.image = UIImage(named: "AppIconImage")
        appIcon.layer.cornerRadius = 25
        appIcon.backgroundColor = .orange
        
        // Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Biometrics"
        titleLabel.textColor = normalTextColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        // Description Label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Not working? Log out and sign back in"
        descriptionLabel.textColor = secondaryTextColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        
        // Sign Out Button
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
    }
    
    
    // MARK: - Layout
    func layout() {
        // App Icon
        view.addSubview(appIcon)
        NSLayoutConstraint.activate([
            appIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 141),
            appIcon.heightAnchor.constraint(equalToConstant: 100),
            appIcon.widthAnchor.constraint(equalToConstant: 100),
            appIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Title Label
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            titleLabel.heightAnchor.constraint(equalToConstant: 38)
        ])

        // Description Label
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 11),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 18)
        ])

        // Sign Out Button
        view.addSubview(signOutButton)
        NSLayoutConstraint.activate([
            signOutButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25),
            signOutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            signOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            signOutButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Functions
    
    @objc func signOutButtonPressed() {
        
    }
    
}

