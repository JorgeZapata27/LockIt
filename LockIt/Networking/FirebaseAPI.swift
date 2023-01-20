//
//  AuthServices.swift
//  LockIt
//
//  Created by JJ Zapata on 11/15/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import FirebaseDatabase

class FirebaseAPI {
    
    static let shared = FirebaseAPI()
    
    func usesBimetrics(_ user: User, completion: @escaping (Bool) -> Void) {
        Database.database().reference().child("Users").child(user.uid).child("personalInfo").child("usesBiometrics").observeSingleEvent(of: .value) { ref in
            if let value = ref.value as? Bool {
                completion(value)
            } else {
                completion(false)
            }
        }
    }
    
    func setBiometrics(_ choice: Bool, _ vc: UIViewController) {
        Haptic().medium()
        if let user = Auth.auth().currentUser {
            Database.database().reference().child("Users").child(user.uid).child("personalInfo").child("usesBiometrics").setValue(choice) { error, ref in
                if error != nil {
                    vc.showErrorAlert(withTitle: "Error", withDescription: error!.localizedDescription)
                } else {
                    vc.goToTabbar()
                }
            }
        }
    }
    
    func updateLastAuth() {
        if let user = Auth.auth().currentUser {
            let iso8601String = Dates.shared.getTodayISO()
            Database.database().reference().child("Users").child(user.uid).child("dates").child("lastAuth").setValue(iso8601String)
        }
    }
    
    func uploadCreatedDate() {
        if let user = Auth.auth().currentUser {
            let iso8601String = Dates.shared.getTodayISO()
            Database.database().reference().child("Users").child(user.uid).child("dates").child("creationDate").setValue(iso8601String)
        }
    }
    
    func uploadVersion() {
        if let user = Auth.auth().currentUser {
            Database.database().reference().child("Users").child(user.uid).child("personalInfo").child("currentVersion").setValue(currentVersion)
        }
    }
    
    func signIn(withEmail email: String, withPassword password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                completion(false, error!.localizedDescription)
            } else {
                self.updateLastAuth()
                self.uploadVersion()
                completion(true, "success")
            }
        }
    }
    
    func createAccount(withFirstName firstName: String, withLastName lastName: String, withEmail email: String, withPassword password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error != nil {
                completion(false, error!.localizedDescription)
            } else {
                // succuss
                self.uploadUserData(withFirstName: firstName, withLastName: lastName, withEmail: email, withUser: user!.user) { success, errorMessage in
                    if success {
                        self.updateLastAuth()
                        self.uploadVersion()
                        self.uploadCreatedDate()
                        completion(true, "success")
                    } else {
                        completion(false, errorMessage)
                    }
                }
            }
        }
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
    
    func appleAuth(withVC vc: UIViewController) {
        AppleAuth.shared.startProcess(withVC: vc)
    }
    
    func googleAuth(withVC vc: UIViewController) {
        GoogleAuth.shared.startProcess(withVC: vc)
    }
    
    func uploadUserData(withFirstName firstName: String, withLastName lastName: String, withEmail email: String, withUser user: User, completion: @escaping (Bool, String) -> Void) {
        let values = [
            "uid": user.uid,
            "personalInfo": [
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "usesBiometrics": true
            ]
        ] as [String : Any]
        Database.database().reference().child("Users").child(user.uid).updateChildValues(values) { error, ref in
            if error != nil {
                completion(false, error!.localizedDescription)
            } else {
                completion(true, "success")
            }
        }
    }
    
    func getAccounts(completion: @escaping([Account]) -> ()) {
        var accounts = [Account]()
        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).child("passwords").observeSingleEvent(of: .childAdded, with: { snapshot in
            if let value = snapshot.value as? [String : Any] {
                let account = Account(withSnapshot: snapshot)
                accounts.append(account)
            }
            completion(accounts)
        })
    }
    
}
