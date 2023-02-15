//
//  InfoView.swift
//  LockIt
//
//  Created by JZ M1 on 06.01.23.
//

import Foundation
import UIKit

class InfoView: UIView {
    
    // MARK: - UI Components
    let titleLabel1 = UILabel()
    let titleLabel2 = UILabel()
    let infoLabel1 = UILabel()
    let infoLabel2 = UILabel()
    let actionButton1 = UIButton()
    let actionButton2 = UIButton()
    let actionView = UIView()
    
    var toCopyText = ""
    var viewNum = 9
    
    var strength : StrengthType?
    
    var title1 = ""
    var title2 = ""
    
    init(title1: String, info1: String, title2: String, info2: String, actionType1: InfoViewActionType, actionType2: InfoViewActionType) {
        super.init(frame: .zero)
        
        style()
        layout()
        setup(title1: title1, info1: info1, title2: title2, info2: info2, actionType1: actionType1, actionType2: actionType2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InfoView {
    
    func style() {
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        titleLabel1.font = .systemFont(ofSize: 12)
        titleLabel1.textColor = secondaryTextColor
        titleLabel1.textAlignment = .left
        
        infoLabel1.translatesAutoresizingMaskIntoConstraints = false
        infoLabel1.font = .boldSystemFont(ofSize: 14)
        infoLabel1.textColor = normalTextColor
        infoLabel1.textAlignment = .left
        
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.font = .systemFont(ofSize: 12)
        titleLabel2.textColor = secondaryTextColor
        titleLabel2.textAlignment = .left
        
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        infoLabel2.font = .boldSystemFont(ofSize: 14)
        infoLabel2.textColor = normalTextColor
        infoLabel2.textAlignment = .left
    }
    
    func layout() {
        addSubview(titleLabel1)
        NSLayoutConstraint.activate([
            titleLabel1.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            titleLabel1.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            titleLabel1.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
            titleLabel1.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        addSubview(infoLabel1)
        NSLayoutConstraint.activate([
            infoLabel1.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 3),
            infoLabel1.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            infoLabel1.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
            infoLabel1.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        addSubview(titleLabel2)
        NSLayoutConstraint.activate([
            titleLabel2.topAnchor.constraint(equalTo: infoLabel1.bottomAnchor, constant: 13),
            titleLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            titleLabel2.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
            titleLabel2.heightAnchor.constraint(equalToConstant: 15)
        ])

        addSubview(infoLabel2)
        NSLayoutConstraint.activate([
            infoLabel2.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 3),
            infoLabel2.leftAnchor.constraint(equalTo: leftAnchor, constant: 11),
            infoLabel2.rightAnchor.constraint(equalTo: rightAnchor, constant: -11),
            infoLabel2.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setup(title1: String, info1: String, title2: String, info2: String, actionType1: InfoViewActionType, actionType2: InfoViewActionType) {
        titleLabel1.text = title1
        infoLabel1.text = info1
        titleLabel2.text = title2
        infoLabel2.text = info2
        
        print("using title 2 for information: \(info1)")
        self.strength = Account().getStrength(strength: info1)
        self.title1 = info1
        self.title2 = info2
        
        switch actionType1 {
        case .copy:
            self.copyAction0()
        case .circle:
            self.circleAction()
        case .none:
            print("nothing to display info view / action button")
        }
        
        switch actionType2 {
        case .copy:
            self.copyAction1()
        case .circle:
            self.circleAction()
        case .none:
            print("nothing to display info view / action button")
        }
    }
    
    @objc func copyText(sender: UIButton) {
        if sender.tag == 0 {
            UIPasteboard.general.string = title1
        } else if sender.tag == 1 {
            UIPasteboard.general.string = title2
        }
    }
    
    private func copyAction0() {
        let actionButton0 = UIButton(type: .system)
        actionButton0.tag = 0
        actionButton0.addTarget(self, action: #selector(copyText), for: .touchUpInside)
        actionButton0.translatesAutoresizingMaskIntoConstraints = false
        actionButton0.setImage(UIImage(systemName: "doc.on.doc"), for: [])
        actionButton0.tintColor = yellowColor
        
        addSubview(actionButton0)
        NSLayoutConstraint.activate([
            actionButton0.heightAnchor.constraint(equalToConstant: 25),
            actionButton0.widthAnchor.constraint(equalToConstant: 25),
            actionButton0.centerYAnchor.constraint(equalTo: topAnchor, constant: 30),
            actionButton0.rightAnchor.constraint(equalTo: rightAnchor, constant: -9)
        ])
    }
    
    private func copyAction1() {
        let actionButton0 = UIButton(type: .system)
        actionButton0.tag = 1
        actionButton0.addTarget(self, action: #selector(copyText), for: .touchUpInside)
        actionButton0.translatesAutoresizingMaskIntoConstraints = false
        actionButton0.setImage(UIImage(systemName: "doc.on.doc"), for: [])
        actionButton0.tintColor = yellowColor
        
        addSubview(actionButton0)
        NSLayoutConstraint.activate([
            actionButton0.heightAnchor.constraint(equalToConstant: 25),
            actionButton0.widthAnchor.constraint(equalToConstant: 25),
            actionButton0.centerYAnchor.constraint(equalTo: topAnchor, constant: 85),
            actionButton0.rightAnchor.constraint(equalTo: rightAnchor, constant: -9)
        ])
    }
    
    private func circleAction() {
        let view = UIView()
        view.backgroundColor = getStrengthColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.5
        
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            view.widthAnchor.constraint(equalToConstant: 21),
            view.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            view.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    func getStrengthColor() -> UIColor {
        switch strength {
        case .weak:
            return .systemRed
        case .fair:
            return .systemBlue
        case .strong:
            return .systemGreen
        case .unable:
            return .systemOrange
        default:
            return .systemOrange
        }
    }
    
}
