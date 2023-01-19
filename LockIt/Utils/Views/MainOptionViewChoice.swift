//
//  MainOptionViewChoice.swift
//  LockIt
//
//  Created by JZ M1 on 30.12.22.
//

import Foundation
import UIKit

class MainOptionViewChoice: UIView {
    
    var typesLabel = UILabel()
    let button = UIButton()
    var root : UIViewController?
    let imageView = UIImageView()
    
    var titleLabel: String?
    
    init(name: String, rootController controller: UIViewController) {
        super.init(frame: .zero)
        
        root = controller
        titleLabel = name
        
        style(name)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style(_ name: String) {
        backgroundColor = secondaryBackgroundColor
        layer.cornerRadius = 8
        
        typesLabel.translatesAutoresizingMaskIntoConstraints = false
        typesLabel.text = name
        typesLabel.font = .boldSystemFont(ofSize: 17)
        typesLabel.textAlignment = .left
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        
        if name == "Accounts & Apps" {
            imageView.image = UIImage(named: "floatingIcons")
        } else {
            imageView.image = UIImage(named: "floatingCards")
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(typesLabel)
        NSLayoutConstraint.activate([
            typesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            typesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            typesLabel.rightAnchor.constraint(equalTo: rightAnchor),
            typesLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leftAnchor.constraint(equalTo: leftAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func handleTap() {
        guard let titleLabel = titleLabel else {
            return
        }
        
        if titleLabel == "Accounts & Apps" {
            root?.navigationController?.pushViewController(AccountsViewController(), animated: true)
        } else {
            root?.navigationController?.pushViewController(CardsViewController(), animated: true)
        }
    }
    
}
