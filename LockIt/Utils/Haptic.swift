//
//  Biometrics.swift
//  LockIt
//
//  Created by JJ Zapata on 11/25/22.
//

import Foundation
import UIKit

class Haptic {
    
    static let shared = Haptic()
    
    func medium() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
}
