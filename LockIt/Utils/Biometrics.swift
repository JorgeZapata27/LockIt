//
//  Biometrics.swift
//  LockIt
//
//  Created by JJ Zapata on 11/25/22.
//

import Foundation
import LocalAuthentication

enum BiometricType {
    case touchID
    case faceID
}

class Biometrics {
    
    func getAuthType() -> BiometricType {
        let context = LAContext()
        let biometry = context.biometryType
        
        switch biometry {
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        default:
            return .faceID
        }
    }
    
    func securityCheck(completion: @escaping (Bool, String) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        completion(true, "success") 
                    } else {
                        completion(false, "Biometrics didn't match")
                    }
                }
            }
        } else {
            completion(false, "Biometrics not enabled. Please check your settings")
        }
    }
    
}
