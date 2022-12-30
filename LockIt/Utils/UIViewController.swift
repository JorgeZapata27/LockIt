//
//  UIViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/23/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func goToTabbar() {
        let controller = UINavigationController(rootViewController: TabBarController())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    func goToBiometricsConfig() {
        let controller = UINavigationController(rootViewController: SetupBiometrics())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
}
