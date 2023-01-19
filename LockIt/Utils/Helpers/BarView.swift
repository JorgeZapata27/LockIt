//
//  BarView.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addBarView() {
        // UI Components
        let barView = UIView()
        
        // Styling
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.backgroundColor = backgroundColor
        barView.layer.shadowColor = shadowColor
        barView.layer.shadowOpacity = 0.4
        barView.layer.shadowRadius = 5.0
        
        // Layer
        view.addSubview(barView)
        NSLayoutConstraint.activate([
            barView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            barView.rightAnchor.constraint(equalTo: view.rightAnchor),
            barView.leftAnchor.constraint(equalTo: view.leftAnchor),
            barView.heightAnchor.constraint(equalToConstant: (tabBarController?.tabBar.frame.size.height) ?? 0 + 16)
        ])
    }
    
}
