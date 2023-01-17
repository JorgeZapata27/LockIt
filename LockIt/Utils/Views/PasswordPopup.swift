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
        let blurView = UIView()
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.backgroundColor = .black
        blurView.alpha = 0.5
        vc.view.addSubview(blurView)
        
        let blurButton = UIButton()
        blurButton.translatesAutoresizingMaskIntoConstraints = false
        blurButton.backgroundColor = .blue
        blurButton.addTarget(self, action: #selector(tappedBlurView), for: .touchUpInside)
        blurView.addSubview(blurButton)
        
        let view = UIView()
        view.backgroundColor = normalBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(view)
        
        let defResultLabel = UILabel()
        defResultLabel.translatesAutoresizingMaskIntoConstraints = false
        defResultLabel.text = "Result"
        defResultLabel.textColor = secondaryTextColor
        defResultLabel.font = .systemFont(ofSize: 16)
        defResultLabel.textAlignment = .left
        view.addSubview(defResultLabel)
        
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = password
        resultLabel.textColor = normalTextColor
        resultLabel.font = .boldSystemFont(ofSize: 25)
        resultLabel.textAlignment = .left
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            blurView.rightAnchor.constraint(equalTo: vc.view.rightAnchor),
            blurView.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            blurView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            
            blurButton.topAnchor.constraint(equalTo: blurView.topAnchor),
            blurButton.leftAnchor.constraint(equalTo: blurView.leftAnchor),
            blurButton.rightAnchor.constraint(equalTo: blurView.rightAnchor),
            blurButton.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            
            view.topAnchor.constraint(equalTo: vc.view.bottomAnchor, constant: -215),
            view.leftAnchor.constraint(equalTo: vc.view.leftAnchor),
            view.rightAnchor.constraint(equalTo: vc.view.rightAnchor),
            view.heightAnchor.constraint(equalToConstant: 215),
            
            defResultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 36),
            defResultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            defResultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            defResultLabel.heightAnchor.constraint(equalToConstant: 18),
            
            resultLabel.topAnchor.constraint(equalTo: defResultLabel.bottomAnchor, constant: 10),
            resultLabel.leftAnchor.constraint(equalTo: defResultLabel.leftAnchor),
            resultLabel.rightAnchor.constraint(equalTo: defResultLabel.rightAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, animations: {
            view.center.y -= 215
        })
    }
    
    @objc func tappedBlurView() {
        print(" hi there ")
    }
    
}
