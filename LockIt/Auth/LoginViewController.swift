//
//  ViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    let scrollView = UIScrollView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let deskLabel = UILabel()
    let emailTF = MainTextField()
    let passwordTF = MainTextField()
    let forgotPasswordButton = UIButton(type: .system)
    let signInButton = MainButton(named: "Sign In")
    let orLabel = UILabel()
    let orLine1 = UIView()
    let orLineView = UIView()
    let appleButton = MainButton(withThirdParty: .apple)
    let googleButton = MainButton(withThirdParty: .google)
    let createAccountButton = UIButton(type: .system)
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension LoginViewController {
    
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
        titleLabel.text = "Sign In"
        titleLabel.textAlignment = .left
        titleLabel.textColor = normalTextColor
        
        // Desc Label
        deskLabel.translatesAutoresizingMaskIntoConstraints = false
        deskLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        deskLabel.text = "Welcome to LockIt! 👋"
        deskLabel.textAlignment = .left
        deskLabel.textColor = secondaryTextColor
        
        // Email TF
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.titleLabel.text = "Email Address"
        emailTF.textField.placeholder = "johndoe@gmail.com"
        emailTF.textField.keyboardType = .emailAddress
        
        // Password TF
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.titleLabel.text = "Password"
        passwordTF.textField.placeholder = "Your Password"
        passwordTF.textField.isSecureTextEntry = true
        
        // Forgot Password
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot Password", for: .normal)
        forgotPasswordButton.titleLabel?.textAlignment = .right
        forgotPasswordButton.titleLabel!.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        forgotPasswordButton.setTitleColor(secondaryTextColor, for: .normal)
        forgotPasswordButton.contentHorizontalAlignment = .right
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        
        // Main Button
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
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
        
        // Third Party Buttons
        appleButton.addTarget(self, action: #selector(appleButtonPressed), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
        
        // Or Create An Account
        var createAccountTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.foregroundColor : normalTextColor!, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)])
        createAccountTitle.append(NSAttributedString(string: "Create Account", attributes: [NSAttributedString.Key.foregroundColor : yellowColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .bold)]))
        createAccountButton.setAttributedTitle(createAccountTitle, for: .normal)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
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
        
        // Desc Label
        scrollView.addSubview(deskLabel)
        NSLayoutConstraint.activate([
            deskLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            deskLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            deskLabel.heightAnchor.constraint(equalToConstant: 18),
            deskLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        // Email Text Field
        scrollView.addSubview(emailTF)
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: deskLabel.bottomAnchor, constant: 52),
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
        
        // Forgot Password Button
        scrollView.addSubview(forgotPasswordButton)
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 15),
            forgotPasswordButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            forgotPasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        // Sign In Button
        scrollView.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 18),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Or Lines
        scrollView.addSubview(orLine1)
        NSLayoutConstraint.activate([
            orLine1.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 33),
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
        
        // Apple Button
        scrollView.addSubview(appleButton)
        NSLayoutConstraint.activate([
            appleButton.topAnchor.constraint(equalTo: orLineView.bottomAnchor, constant: 33),
            appleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            appleButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 75) / 2),
            appleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Apple Button
        scrollView.addSubview(googleButton)
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: orLineView.bottomAnchor, constant: 33),
            googleButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            googleButton.widthAnchor.constraint(equalToConstant: (view.frame.width - 75) / 2),
            googleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Create Account Button
        scrollView.addSubview(createAccountButton)
        NSLayoutConstraint.activate([
            createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            createAccountButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    // MARK: - Functions
    
    @objc func forgotPasswordButtonPressed() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    @objc func signInButtonPressed() {
        //
    }
    
    @objc func googleButtonPressed() {
        //
    }
    
    @objc func appleButtonPressed() {
        //
    }
    
}
