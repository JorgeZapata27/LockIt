//
//  AccountViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - UI Components
    let icon = UIView()
    let iconImage = UIImageView()
    let titleLabel = UILabel()
    let emailView = UIView()
    let emailLabel = UILabel()
    var bigView1 : SettingsView?
    var bigView2 : SettingsView?
    var bigView3 : SettingsView?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension SettingsViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        addBarView()
        
        bigView1 = SettingsView(height: 111, options: [SettingsOption(titleText: "App Version"), SettingsOption(titleText: "Rate Us"),  SettingsOption(titleText: "Share LockIt")], tag: 0, vc: self)
        
        bigView2 = SettingsView(height: 80, options: [SettingsOption(titleText: "Privacy Policy"), SettingsOption(titleText: "Terms & Conditions")], tag: 1, vc: self)
        
        bigView3 = SettingsView(height: 49, options: [SettingsOption(titleText: "Sign Out")], tag: 2, vc: self)
    }
    
    // MARK: - Styling
    func style() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.backgroundColor = normalTextColor
        icon.layer.cornerRadius = 40
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage(named: "Transparent")
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Name"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textColor = normalTextColor
        
        emailView.translatesAutoresizingMaskIntoConstraints = false
        emailView.backgroundColor = yellowColor
        emailView.layer.cornerRadius = 15
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "email@gmail.com"
        emailLabel.textAlignment = .center
        emailLabel.textColor = .black
        emailLabel.font = .boldSystemFont(ofSize: 11)
    }
    
    
    // MARK: - Layout
    func layout() {
        view.backgroundColor = normalBackgroundColor
        
        view.addSubview(icon)
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        icon.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 70),
            iconImage.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 9),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        view.addSubview(emailView)
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            emailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailView.heightAnchor.constraint(equalToConstant: 30),
            emailView.widthAnchor.constraint(equalToConstant: 208)
        ])
        
        emailView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: emailView.topAnchor),
            emailLabel.leftAnchor.constraint(equalTo: emailView.leftAnchor),
            emailLabel.rightAnchor.constraint(equalTo: emailView.rightAnchor),
            emailLabel.bottomAnchor.constraint(equalTo: emailView.bottomAnchor)
        ])
        
        view.addSubview(bigView1!)
        NSLayoutConstraint.activate([
            bigView1!.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 28),
            bigView1!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bigView1!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        view.addSubview(bigView2!)
        NSLayoutConstraint.activate([
            bigView2!.topAnchor.constraint(equalTo: bigView1!.bottomAnchor, constant: 16),
            bigView2!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bigView2!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
        
        view.addSubview(bigView3!)
        NSLayoutConstraint.activate([
            bigView3!.topAnchor.constraint(equalTo: bigView2!.bottomAnchor, constant: 16),
            bigView3!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            bigView3!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
    // MARK: - Functions
    
}
