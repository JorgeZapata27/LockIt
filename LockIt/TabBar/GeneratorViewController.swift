//
//  GeneratorViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class GeneratorViewController: UIViewController {
    
    // MARK: - UI Components
    let lengthView = LengthView()
    var preferenceView: PreferenceView?
    let generateButton = MainButton(named: "Generate Password")
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension GeneratorViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Generator"
        addBarView()
    }
    
    // MARK: - Styling
    func style() {
        // Length View
        lengthView.translatesAutoresizingMaskIntoConstraints = false
        
        // Generate Button
        generateButton.translatesAutoresizingMaskIntoConstraints = false
        generateButton.addTarget(self, action: #selector(generateButtonPressed), for: .touchUpInside)
    }
    
    
    // MARK: - Layout
    func layout() {
        // Length View
        view.addSubview(lengthView)
        NSLayoutConstraint.activate([
            lengthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            lengthView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            lengthView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            lengthView.heightAnchor.constraint(equalToConstant: 85)
        ])
        lengthView.lengthSlider.setValue(8, animated: true)
        
        // Preference View
        let width = self.view.frame.size.width - 48
        preferenceView = PreferenceView(width: Int(width))
        if let preferenceView {
            preferenceView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(preferenceView)
            NSLayoutConstraint.activate([
                preferenceView.topAnchor.constraint(equalTo: lengthView.bottomAnchor, constant: 16),
                preferenceView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
                preferenceView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
                preferenceView.heightAnchor.constraint(equalToConstant: 180)
            ])
            
            // Generate Button
            view.addSubview(generateButton)
            NSLayoutConstraint.activate([
                generateButton.topAnchor.constraint(equalTo: preferenceView.bottomAnchor, constant: 16),
                generateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
                generateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
                generateButton.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
    }
    
    // MARK: - Functions
    
    @objc func generateButtonPressed() {
        let length = lengthView.lengthSlider.value
        let hasNumbers = preferenceView?.hasNumbers?.preferenceSwitch?.isOn
        let hasLetters = preferenceView?.hasLetters?.preferenceSwitch?.isOn
        let hasCharacters = preferenceView?.hasCharacters?.preferenceSwitch?.isOn
        
        let password = PasswordGenerator().generate(withLength: Int(length), hasNumbers: hasNumbers ?? true, hasLetters: hasLetters ?? true, hasCharacters: hasCharacters ?? true)
        
        PasswordPopup().showPasswordPopup(password: password, vc: self)
    }
    
}
