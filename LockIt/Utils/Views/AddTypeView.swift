//
//  AddTypeView.swift
//  LockIt
//
//  Created by JZ M1 on 15.02.23.
//

import Foundation
import UIKit

class AddTypeView: UIView {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descLabel = UILabel()
    let button = UIButton()
    
    var type : AddType?
    var vc = UIViewController()
    
    init(type: AddType) {
        super.init(frame: .zero)
        
        self.type = type
        
        general()
        style()
        layout()
        setup(type: type)
    }
    
    func addVC(_ vc: UIViewController) {
        self.vc = vc
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func general() {
        // general
        backgroundColor = secondaryBackgroundColor
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        
        // layout
        heightAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    private func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = normalTextColor
        titleLabel.textAlignment = .left
        
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.font = .systemFont(ofSize: 12)
        descLabel.textColor = normalTextColor
        descLabel.textAlignment = .left
        descLabel.numberOfLines = 3
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    private func layout() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 55),
            imageView.widthAnchor.constraint(equalToConstant: 55)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        addSubview(descLabel)
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -5),
            descLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 12),
            descLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leftAnchor.constraint(equalTo: leftAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setup(type: AddType) {
        switch type {
        case .account:
            imageView.image = UIImage(named: "key-account")
            titleLabel.text = "Account"
            descLabel.text = "Holds your login credentials to various apps, websites, and more"
        case .card:
            imageView.image = UIImage(named: "card-card")
            titleLabel.text = "Card"
            descLabel.text = "Secures your credit / debit card details so you don’t have to "
        }
    }
    
    @objc func onTap() {
        if let type = type {
            switch type {
            case .account:
                print("account")
                let controller = AddAccountController()
                vc.present(controller, animated: true)
            case .card:
                print("card")
                let controller = AddCardController()
                vc.present(controller, animated: true)
            }
        }
    }
    
}
