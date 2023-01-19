//
//  ForgotPassswordViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/15/22.
//

import UIKit
import FirebaseAuth

class ForgotPassswordViewController: UIViewController {
    
    // MARK: - UI Components
    let fpImageView = UIImageView()
    let emailTF = MainTextField()
    let resetButton = MainButton(named: "Send Reset Link")
    let infoLabel = UILabel()
    
    // MARK: - Variables
    var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        keybaordSetup()
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension ForgotPassswordViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Reset Password"
    }
    
    // MARK: - Styling
    func style() {
        // Forgot Password Image View
        fpImageView.translatesAutoresizingMaskIntoConstraints = false
        fpImageView.contentMode = .scaleAspectFit
        fpImageView.image = UIImage(named: "fp")
        
        // Email TF
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.titleLabel.text = "Email Address"
        emailTF.textField.placeholder = "johndoe@gmail.com"
        emailTF.textField.keyboardType = .emailAddress
        emailTF.textField.autocapitalizationType = .none
        emailTF.textField.delegate = self
        
        // Main Button
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        
        // Info Label
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 2
        infoLabel.text = "A password recovery link will only be sent to the email given if it is connected to an account."
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.textColor = secondaryTextColor
    }
    
    
    // MARK: - Layout
    func layout() {
        // Forgot Password Image View
        view.addSubview(fpImageView)
        NSLayoutConstraint.activate([
            fpImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fpImageView.widthAnchor.constraint(equalToConstant: 200),
            fpImageView.heightAnchor.constraint(equalToConstant: 158),
            fpImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 93)
        ])
        
        // Email Text Field
        view.addSubview(emailTF)
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: fpImageView.bottomAnchor, constant: 41),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            emailTF.heightAnchor.constraint(equalToConstant: 70),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        // Sign In Button
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 18),
            resetButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            resetButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Info Label
        view.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            infoLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -46)
        ])
    }
    
    // MARK: - Functions
    
    private func keybaordSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func showSuccessAlert(withEmail email: String) {
        let alert = UIAlertController(title: "Success!", message: "A password reset link has been sent to \(email)!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    // MARK: - @OBJC Functions
    
    @objc func keyboardWillShow() {
        view.frame.origin.y = view.frame.origin.y - 75
    }
    
    @objc func keyboardWillHide() {
        view.frame.origin.y = 0
    }
    
    @objc func resetButtonPressed() {
        showLoading()
        guard let email = emailTF.textField.text else { return }

        if (email.isValidEmail()) {
            FirebaseAPI.shared.sendPasswordResetLink(withEmail: email) { success, errorMessage in
                if success {
                    self.hideLoading()
                    self.showSuccessAlert(withEmail: email)
                } else {
                    self.hideLoading()
                    self.showErrorAlert(withTitle: "Error", withDescription: errorMessage)
                }
            }
        } else {
            hideLoading()
            showErrorAlert(withTitle: "Error", withDescription: "Email is not valid")
        }
    }
    
}

extension ForgotPassswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
