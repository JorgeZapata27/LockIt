//
//  LoadingDialog.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import Foundation
import UIKit
import ProgressHUD

extension UIViewController {
    
    func showLoading() {
        ProgressHUD.show()
    }
    
    func hideLoading() {
        ProgressHUD.dismiss()
    }
    
}
