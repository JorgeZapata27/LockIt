//
//  MainOptionView.swift
//  LockIt
//
//  Created by JZ M1 on 30.12.22.
//

import Foundation
import UIKit

class MainOptionView: UIView {
    
    let typesLabel = UILabel()
    var accountView : MainOptionViewChoice?
    var cardsView : MainOptionViewChoice?
    
    init(view: UIView, rootViewController root: UIViewController) {
        super.init(frame: .zero)
        
        accountView = MainOptionViewChoice(name: "Accounts & Apps", rootController: root)
        cardsView = MainOptionViewChoice(name: "Cards", rootController: root)
        
        style()
        layout(const: (view.frame.size.width - 48) / 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        typesLabel.translatesAutoresizingMaskIntoConstraints = false
        typesLabel.text = "TYPES"
        typesLabel.font = .boldSystemFont(ofSize: 12)
        typesLabel.textAlignment = .left
        
        accountView!.translatesAutoresizingMaskIntoConstraints = false
        
        cardsView!.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(const: CGFloat) {
        addSubview(typesLabel)
        NSLayoutConstraint.activate([
            typesLabel.topAnchor.constraint(equalTo: topAnchor),
            typesLabel.leftAnchor.constraint(equalTo: leftAnchor),
            typesLabel.rightAnchor.constraint(equalTo: rightAnchor),
            typesLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        addSubview(accountView!)
        NSLayoutConstraint.activate([
            accountView!.topAnchor.constraint(equalTo: typesLabel.bottomAnchor, constant: 14),
            accountView!.leftAnchor.constraint(equalTo: leftAnchor),
            accountView!.widthAnchor.constraint(equalToConstant: const),
            accountView!.heightAnchor.constraint(equalToConstant: 264)
        ])
        
        addSubview(cardsView!)
        NSLayoutConstraint.activate([
            cardsView!.topAnchor.constraint(equalTo: typesLabel.bottomAnchor, constant: 14),
            cardsView!.rightAnchor.constraint(equalTo: rightAnchor),
            cardsView!.widthAnchor.constraint(equalToConstant: const),
            cardsView!.heightAnchor.constraint(equalToConstant: 264)
        ])
    }
    
}
