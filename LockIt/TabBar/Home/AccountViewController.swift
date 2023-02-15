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
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let typeLabel = UILabel()
    let editButton = AccountButton()
    let favoriteButton = AccountButton()
    var infoView1 : InfoView?
    var infoView2 : InfoView?
    
    // MARK: - Variables
    
    var account : Account? {
        didSet {
            if let account = account {
                if let name = account.name {
                    navigationItem.title = name.capitalized
                }
                if let url = account.imageURL {
                    imageView.loadThumbnail(urlSting: url)
                }
            }
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
        addBarView()
    }
    
    // MARK: - Styling
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = secondaryBackgroundColor
        imageView.layer.cornerRadius = 12
        
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
        
        infoView1 = InfoView(title1: "Email", info1: account?.username ?? "Error not found", title2: "Password", info2: account?.password ?? "Error not found", actionType1: .copy, actionType2: .copy)
        infoView1!.translatesAutoresizingMaskIntoConstraints = false
        infoView1!.backgroundColor = secondaryBackgroundColor
        infoView1!.layer.cornerRadius = 8
        
        infoView2 = InfoView(title1: "Password Strength", info1: account!.strength!.toString(), title2: "Date Added", info2: account!.dateAddedString!, actionType1: .circle, actionType2: .none)
        infoView2!.translatesAutoresizingMaskIntoConstraints = false
        infoView2!.backgroundColor = secondaryBackgroundColor
        infoView2!.layer.cornerRadius = 8
    }
    
    
    // MARK: - Layout
    func layout() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(infoView1!)
        NSLayoutConstraint.activate([
            infoView1!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            infoView1!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            infoView1!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            infoView1!.heightAnchor.constraint(equalToConstant: 118)
        ])
        
        view.addSubview(infoView2!)
        NSLayoutConstraint.activate([
            infoView2!.topAnchor.constraint(equalTo: infoView1!.bottomAnchor, constant: 16),
            infoView2!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            infoView2!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            infoView2!.heightAnchor.constraint(equalToConstant: 118)
        ])
    }
    
    // MARK: - Functions
    
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }
    
}
