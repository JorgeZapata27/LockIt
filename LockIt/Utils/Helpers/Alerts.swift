//
//  Alerts.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import Foundation
import UIKit
import ProgressHUD

extension UIViewController {
    
    func showErrorAlert(withTitle title: String, withDescription desc: String) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
        
        let alert = UIAlertController(title: title, message: desc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
    func showSuccess(titled title: String) {
        ProgressHUD.showSucceed(title, interaction: false)
    }
    
}
