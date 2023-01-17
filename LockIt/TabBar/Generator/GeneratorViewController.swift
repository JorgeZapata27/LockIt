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
    
    // Popup
    let blurView = UIView()
    let popupView = UIView()
    let blurButton = UIButton()
    let defResultLabel = UILabel()
    let resultLabel = UILabel()
    let buttonView = UIView()
    
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
        preferenceView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(preferenceView!)
        NSLayoutConstraint.activate([
            preferenceView!.topAnchor.constraint(equalTo: lengthView.bottomAnchor, constant: 16),
            preferenceView!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            preferenceView!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            preferenceView!.heightAnchor.constraint(equalToConstant: 180)
        ])

        // Generate Button
        view.addSubview(generateButton)
        NSLayoutConstraint.activate([
            generateButton.topAnchor.constraint(equalTo: preferenceView!.bottomAnchor, constant: 16),
            generateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            generateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            generateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Functions
    
    @objc func generateButtonPressed() {
        let length = lengthView.lengthSlider.value
        let hasNumbers = preferenceView?.hasNumbers?.preferenceSwitch?.isOn
        let hasLetters = preferenceView?.hasLetters?.preferenceSwitch?.isOn
        let hasCharacters = preferenceView?.hasCharacters?.preferenceSwitch?.isOn
        
        let password = PasswordGenerator().generate(withLength: Int(length), hasNumbers: hasNumbers ?? true, hasLetters: hasLetters ?? true, hasCharacters: hasCharacters ?? true)
        
        print(password)
        
//        PasswordPopup().showPasswordPopup(password: password, vc: self)
        showPasswordPopup(password: password)
    }
    
    func showPasswordPopup(password: String) {
        // lifecycle help
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.backgroundColor = .black
        blurView.alpha = 0
        view.addSubview(blurView)
        
        blurButton.translatesAutoresizingMaskIntoConstraints = false
        blurButton.backgroundColor = .clear
        blurButton.addTarget(self, action: #selector(tappedBlurView), for: .touchUpInside)
        blurView.addSubview(blurButton)
        
        popupView.backgroundColor = normalBackgroundColor
        popupView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupView)
        
        defResultLabel.translatesAutoresizingMaskIntoConstraints = false
        defResultLabel.text = "Result"
        defResultLabel.textColor = secondaryTextColor
        defResultLabel.font = .systemFont(ofSize: 16)
        defResultLabel.textAlignment = .left
        popupView.addSubview(defResultLabel)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = password
        resultLabel.textColor = normalTextColor
        resultLabel.font = .boldSystemFont(ofSize: 25)
        resultLabel.textAlignment = .left
        popupView.addSubview(resultLabel)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = normalBackgroundColor
        popupView.addSubview(buttonView)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.rightAnchor.constraint(equalTo: view.rightAnchor),
            blurView.leftAnchor.constraint(equalTo: view.leftAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blurButton.topAnchor.constraint(equalTo: blurView.topAnchor),
            blurButton.leftAnchor.constraint(equalTo: blurView.leftAnchor),
            blurButton.rightAnchor.constraint(equalTo: blurView.rightAnchor),
            blurButton.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            
            popupView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -215),
            popupView.leftAnchor.constraint(equalTo: view.leftAnchor),
            popupView.rightAnchor.constraint(equalTo: view.rightAnchor),
            popupView.heightAnchor.constraint(equalToConstant: 215),
            
            defResultLabel.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 36),
            defResultLabel.leftAnchor.constraint(equalTo: popupView.leftAnchor, constant: 16),
            defResultLabel.rightAnchor.constraint(equalTo: popupView.rightAnchor, constant: -16),
            defResultLabel.heightAnchor.constraint(equalToConstant: 18),
            
            resultLabel.topAnchor.constraint(equalTo: defResultLabel.bottomAnchor, constant: 10),
            resultLabel.leftAnchor.constraint(equalTo: defResultLabel.leftAnchor),
            resultLabel.rightAnchor.constraint(equalTo: defResultLabel.rightAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 32),
            
            buttonView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 15),
            buttonView.leftAnchor.constraint(equalTo: popupView.leftAnchor),
            buttonView.rightAnchor.constraint(equalTo: popupView.rightAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        self.showView()
    }
    
    @objc func tappedBlurView() {
        hideView()
    }
    
    private func showView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, animations: {
            self.popupView.center.y -= 215
            self.blurView.alpha = 0.5
        })
    }
    
    private func hideView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, animations: {
            self.popupView.center.y += 215
            self.blurView.alpha = 0
        })
    }
    
}
