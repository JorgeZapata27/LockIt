//
//  SignUpViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    // MARK: - UI Components
    let scrollView = UIScrollView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let appleButton = MainButton(withThirdParty: .apple)
    let googleButton = MainButton(withThirdParty: .google)
    let orLabel = UILabel()
    let orLine1 = UIView()
    let orLineView = UIView()
    let firstNameTF = MainTextField()
    let lastNameTF = MainTextField()
    let emailTF = MainTextField()
    let passwordTF = MainTextField()
    let createAccountButton = MainButton(named: "Create Account")
    let signInButton = UIButton(type: .system)
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension SignUpViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
    }
    
    // MARK: - Styling
    func style() {
        // Scroll View
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        scrollView.backgroundColor = backgroundColor
        scrollView.keyboardDismissMode = .onDrag
        
        // Logo Image View
        logoImageView.image = UIImage(named: "AppIconImage")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        
        // Title Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.text = "Create Account"
        titleLabel.textAlignment = .left
        titleLabel.textColor = normalTextColor
        
        // Third Party Buttons
        appleButton.addTarget(self, action: #selector(appleButtonPressed), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
        
        // Or Label
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        orLabel.text = "Or continue with"
        orLabel.textAlignment = .center
        orLabel.textColor = secondaryTextColor
        
        // Or View 1
        orLine1.translatesAutoresizingMaskIntoConstraints = false
        orLine1.backgroundColor = secondaryTextColor
        
        // Or Line View
        orLineView.translatesAutoresizingMaskIntoConstraints = false
        orLineView.backgroundColor = normalBackgroundColor
        
        // First Name TF
        firstNameTF.translatesAutoresizingMaskIntoConstraints = false
        firstNameTF.titleLabel.text = "First Name"
        firstNameTF.textField.placeholder = "John"
        firstNameTF.textField.autocapitalizationType = .words
        firstNameTF.textField.delegate = self
        
        // Last Name TF
        lastNameTF.translatesAutoresizingMaskIntoConstraints = false
        lastNameTF.titleLabel.text = "Last Name"
        lastNameTF.textField.placeholder = "Doe"
        lastNameTF.textField.autocapitalizationType = .words
        lastNameTF.textField.delegate = self
        
        // Email TF
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.titleLabel.text = "Email Address"
        emailTF.textField.placeholder = "johndoe@gmail.com"
        emailTF.textField.keyboardType = .emailAddress
        emailTF.textField.autocapitalizationType = .none
        emailTF.textField.delegate = self
        
        // Password TF
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.titleLabel.text = "Password"
        passwordTF.textField.placeholder = "Your Password"
        passwordTF.textField.isSecureTextEntry = true
        passwordTF.textField.delegate = self
        
        // Main Button
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        
        // Or Sign In
        let signInTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.foregroundColor : normalTextColor!, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)])
        signInTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.foregroundColor : yellowColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .bold)]))
        signInButton.setAttributedTitle(signInTitle, for: .normal)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
    
    
    // MARK: - Layout
    func layout() {
        // Scroll View
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Logo Image View
        scrollView.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 14),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            logoImageView.widthAnchor.constraint(equalToConstant: 45),
            logoImageView.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        // Title Label
        scrollView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 22),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            titleLabel.heightAnchor.constraint(equalToConstant: 42),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        // Apple Button
        scrollView.addSubview(appleButton)
        NSLayoutConstraint.activate([
            appleButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            appleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            appleButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 75) / 2),
            appleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Apple Button
        scrollView.addSubview(googleButton)
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            googleButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            googleButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 75) / 2),
            googleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Or Lines
        scrollView.addSubview(orLine1)
        NSLayoutConstraint.activate([
            orLine1.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 33),
            orLine1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            orLine1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            orLine1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        // Or Line View
        scrollView.addSubview(orLineView)
        NSLayoutConstraint.activate([
            orLineView.centerYAnchor.constraint(equalTo: orLine1.centerYAnchor),
            orLineView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orLineView.widthAnchor.constraint(equalToConstant: 150),
            orLineView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Or Label
        scrollView.addSubview(orLabel)
        NSLayoutConstraint.activate([
            orLabel.centerYAnchor.constraint(equalTo: orLineView.centerYAnchor),
            orLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            orLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            orLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        // First Name TF
        scrollView.addSubview(firstNameTF)
        NSLayoutConstraint.activate([
            firstNameTF.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 33),
            firstNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            firstNameTF.heightAnchor.constraint(equalToConstant: 76),
            firstNameTF.widthAnchor.constraint(equalToConstant: (view.frame.size.width - 75) / 2)
        ])
        
        // Last Name TF
        scrollView.addSubview(lastNameTF)
        NSLayoutConstraint.activate([
            lastNameTF.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 33),
            lastNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            lastNameTF.heightAnchor.constraint(equalToConstant: 76),
            lastNameTF.widthAnchor.constraint(equalToConstant: (view.frame.size.width - 75) / 2)
        ])
        
        // Email Text Field
        scrollView.addSubview(emailTF)
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: 14),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            emailTF.heightAnchor.constraint(equalToConstant: 70),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        // Password Text Field
        scrollView.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 14),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            passwordTF.heightAnchor.constraint(equalToConstant: 70),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        // Create Account Button
        scrollView.addSubview(createAccountButton)
        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 24),
            createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            createAccountButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Sign In Button
        scrollView.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    // MARK: - Functions
    
    @objc func createAccountButtonPressed() {
        showLoading()
        guard let firstName = firstNameTF.textField.text else { return }
        guard let lastName = lastNameTF.textField.text else { return }
        guard let email = emailTF.textField.text else { return }
        guard let password = passwordTF.textField.text else { return }
        
        if (email.isValidEmail()) {
            if (password.isValidPassword()) {
                FirebaseAPI.shared.createAccount(withFirstName: firstName, withLastName: lastName, withEmail: email, withPassword: password) { success, errorMessage in
                    if success {
                        self.goToBiometricsConfig()
                    } else {
                        self.hideLoading()
                        self.showErrorAlert(withTitle: "Error", withDescription: errorMessage)
                    }
                }
            } else {
                self.hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Password must exceed 8 characters")
            }
        } else {
            self.hideLoading()
            showErrorAlert(withTitle: "Error", withDescription: "Email is not valid")
        }
    }
    
    @objc func googleButtonPressed() {
        FirebaseAPI.shared.googleAuth(withVC: self)
    }
    
    @objc func appleButtonPressed() {
        FirebaseAPI.shared.appleAuth(withVC: self)
    }
    
    @objc func signInButtonPressed() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        let controller = UINavigationController(rootViewController: LoginViewController())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTF.textField:
            textField.resignFirstResponder()
            lastNameTF.textField.becomeFirstResponder()
        case lastNameTF.textField:
            textField.resignFirstResponder()
            emailTF.textField.becomeFirstResponder()
        case emailTF.textField:
            textField.resignFirstResponder()
            passwordTF.textField.becomeFirstResponder()
        case passwordTF.textField:
            textField.resignFirstResponder()
            createAccountButtonPressed()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}
