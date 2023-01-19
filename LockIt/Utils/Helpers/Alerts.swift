//
//  Alerts.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErrorAlert(withTitle title: String, withDescription desc: String) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
        
        let alert = UIAlertController(title: title, message: desc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
}
