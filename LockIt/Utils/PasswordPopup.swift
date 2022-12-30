//
//  PasswordPopup.swift
//  LockIt
//
//  Created by JJ Zapata on 11/26/22.
//

import Foundation
import UIKit

class PasswordPopup {
    
//    func buildPopup() -> UIView {
//        let view = UIView()
//        view.backgroundColor = .orange
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.frame =
//        return view
//    }
    
    func showPasswordPopup(password: String, vc: UIViewController) {
//        let popup = buildPopup()
        let view = UIView()
        view.backgroundColor = normalBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
//        window.addSubview(view)
        vc.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: vc.view.bottomAnchor, constant: -215),
            view.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            view.rightAnchor.constraint(equalTo: vc.view.rightAnchor),
            view.heightAnchor.constraint(equalToConstant: 215)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, animations: {
            view.center.y -= 215
        })
        
        print("hi")
    }
    
}
