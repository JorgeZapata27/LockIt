//
//  AuthServices.swift
//  LockIt
//
//  Created by JJ Zapata on 11/15/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class FirebaseAPI {
    
    static let shared = FirebaseAPI()
    
    func signIn(withEmail email: String, withPassword password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                completion(false, error!.localizedDescription)
            } else {
                completion(true, "success")
            }
        }
    }
    
    func createAccount(withEmail email: String, withPassword password: String, vc: UIViewController) {
        
    }
    
    func sendPasswordResetLink(withEmail email: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                completion(false, error!.localizedDescription)
            } else {
                completion(true, "success")
            }
        }
    }
    
}
