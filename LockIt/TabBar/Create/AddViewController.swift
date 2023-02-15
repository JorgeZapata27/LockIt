//
//  AddViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class AddViewController: UIViewController {
    
    // MARK: - UI Components
    let addAccount = AddTypeView(type: .account)
    let addCard = AddTypeView(type: .card)
    let promptLabel = UILabel()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension AddViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Add"
        addBarView()
    }
    
    // MARK: - Styling
    func style() {
        addAccount.addVC(self)
        
        addCard.addVC(self)
        
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.text = "Select the type that you want to add"
        promptLabel.textColor = normalTextColor
        promptLabel.textAlignment = .center
        promptLabel.font = .systemFont(ofSize: 12)
    }
    
    
    // MARK: - Layout
    func layout() {
        view.addSubview(addAccount)
        NSLayoutConstraint.activate([
            addAccount.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 46),
            addAccount.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            addAccount.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            // height is already configured in view class
        ])
        
        view.addSubview(addCard)
        NSLayoutConstraint.activate([
            addCard.topAnchor.constraint(equalTo: addAccount.bottomAnchor, constant: 16),
            addCard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            addCard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            // height is already configured in view class
        ])
        
        view.addSubview(promptLabel)
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: addCard.bottomAnchor, constant: 30),
            promptLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            promptLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            promptLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    // MARK: - Functions
    
}
