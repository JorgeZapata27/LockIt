//
//  UIApplication.swift
//  LockIt
//
//  Created by JZ M1 on 14.02.23.
//

import Foundation
import UIKit

extension UIApplication {
    var foregroundActiveScene: UIWindowScene? {
        connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    }
}

