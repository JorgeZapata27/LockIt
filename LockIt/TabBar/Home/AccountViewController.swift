//
//  AppAccountViewController.swift
//  LockIt
//
//  Created by JZ M1 on 06.01.23.
//

import Foundation
import UIKit

class AccountViewController: UIViewController {
    
    // MARK: - UI Components
    let backButton = UIButton(type: .system)
    let backText = UIButton(type: .system)
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let typeLabel = UILabel()
    let editButton = AccountButton()
    let favoriteButton = AccountButton()
    let infoView1 = InfoView()
    let infoView2 = InfoView()
    
    // MARK: - Variables
    
    var account : Account? {
        didSet {
            
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension AccountViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.hidesBackButton = true
        addBarView()
    }
    
    // MARK: - Styling
    func style() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: [])
        backButton.tintColor = normalTextColor
        backButton.addTarget(self, action: #selector(popView), for: .touchUpInside)
        
        backText.translatesAutoresizingMaskIntoConstraints = false
        backText.setTitle("Back", for: [])
        backText.setTitleColor(normalTextColor, for: [])
        backText.tintColor = normalTextColor
        backText.addTarget(self, action: #selector(popView), for: .touchUpInside)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = secondaryBackgroundColor
        imageView.layer.cornerRadius = 17
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Name"
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .left
        titleLabel.textColor = normalTextColor
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Login"
        typeLabel.font = .systemFont(ofSize: 16)
        typeLabel.textAlignment = .left
        typeLabel.textColor = secondaryTextColor
    }
    
    
    // MARK: - Layout
    func layout() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 21),
            backButton.widthAnchor.constraint(equalToConstant: 21)
        ])
        
        view.addSubview(backText)
        NSLayoutConstraint.activate([
            backText.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            backText.leftAnchor.constraint(equalTo: backButton.rightAnchor),
            backText.heightAnchor.constraint(equalToConstant: 21),
            backText.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 7),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 17),
            titleLabel.widthAnchor.constraint(equalToConstant: 175),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            typeLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 17),
            typeLabel.widthAnchor.constraint(equalToConstant: 175),
            typeLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
    
    // MARK: - Functions
    
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }
    
}
