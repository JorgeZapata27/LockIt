//
//  AddAcountView.swift
//  LockIt
//
//  Created by JZ M1 on 09.08.23.
//

import Foundation
import UIKit

enum AddAccountViewType {
    case ours, custom
}

class AddAccountView: UIView {
    
    var type : AddAccountViewType = .ours
    
    let oursView = UIView()
    let customView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        oursLayout()
        customLayout()
        change(to: .ours)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func change(to type: AddAccountViewType) {
        if type == .ours {
            showOurs()
        } else {
            showCustom()
        }
    }
    
    func showOurs() {
        UIView.animate(withDuration: 0.25) {
            self.customView.alpha = 0
        } completion: { completed in
            UIView.animate(withDuration: 0.25) {
                self.oursView.alpha = 1
            }
        }
    }
    
    func showCustom() {
        UIView.animate(withDuration: 0.25) {
            self.oursView.alpha = 0
        } completion: { completed in
            UIView.animate(withDuration: 0.25) {
                self.customView.alpha = 1
            }
        }
    }
    
    private func oursLayout() {
        oursView.translatesAutoresizingMaskIntoConstraints = false
        oursView.backgroundColor = .red
        oursView.alpha = 0
        addSubview(oursView)
        oursView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        oursView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        oursView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        oursView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func customLayout() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = .green
        customView.alpha = 0
        addSubview(customView)
        customView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        customView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
