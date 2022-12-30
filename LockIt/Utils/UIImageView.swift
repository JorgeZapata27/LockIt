//
//  UIImage.swift
//  LockIt
//
//  Created by JJ Zapata on 11/25/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setBiometricImage() {
        switch Biometrics().getAuthType() {
        case .faceID:
            self.image = UIImage(named: "faceid")
        case .touchID:
            self.image = UIImage(named: "touchid")
        default:
            self.image = UIImage(named: "faceid")
        }
    }
    
}
