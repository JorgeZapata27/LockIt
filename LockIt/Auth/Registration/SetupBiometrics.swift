//
//  SetupBiometrics.swift
//  LockIt
//
//  Created by JJ Zapata on 11/25/22.
//

import Foundation
import UIKit

class SetupBiometrics: UIViewController {
    
    // MARK: - UI Components
    let backgroundView = UIView()
    let image = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let configureButton = MainButton(named: "Configure")
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension SetupBiometrics {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        
        let skipBtn = UIBarButtonItem(title: "SKIP", style: .done, target: self, action: #selector(selectorX))
        skipBtn.tintColor = .black
        navigationItem.rightBarButtonItem = skipBtn
    }
    
    // MARK: - Styling
    func style() {
        // Background View
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = yellowColor
        
        // Image
        image.setBiometricImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        
        // Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Setup Biometrics"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        // Description Label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.getBiometricText()
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionLabel.textColor = normalTextColor
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 5
        
        // Configure Button
        configureButton.translatesAutoresizingMaskIntoConstraints = false
        configureButton.addTarget(self, action: #selector(configureButtonPressed), for: .touchUpInside)
    }
    
    
    // MARK: - Layout
    func layout() {
        // Background View
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 381)
        ])
        
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 126),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -63),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 130),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 85)
        ])
        
        view.addSubview(configureButton)
        NSLayoutConstraint.activate([
            configureButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            configureButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            configureButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            configureButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Functions
    
    @objc func selectorX() {
        FirebaseAPI.shared.setBiometrics(false, self)
    }
    
    @objc func configureButtonPressed() {
        FirebaseAPI.shared.setBiometrics(true, self)
    }
    
}
