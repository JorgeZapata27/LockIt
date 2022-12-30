//
//  GoogleAuth.swift
//  LockIt
//
//  Created by JJ Zapata on 11/23/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn
import UIKit

class GoogleAuth {
    
    static let shared = GoogleAuth()
    
    func startProcess(withVC vc: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: vc) { [unowned self] user, error in
            vc.showLoading()
            guard error == nil else { return vc.showErrorAlert(withTitle: "Error", withDescription: error!.localizedDescription) }
            guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { result, error in
                if error != nil {
                    vc.showErrorAlert(withTitle: "Error", withDescription: error!.localizedDescription)
                    return
                } else {
                    if Auth.auth().currentUser != nil {
                        Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: .value) { snap in
                            if snap.exists() {
                                print("snap exitsts")
                                print(snap.value)
                                FirebaseAPI.shared.uploadVersion()
                                FirebaseAPI.shared.updateLastAuth()
                                FirebaseAPI.shared.uploadCreatedDate()
                                vc.hideLoading()
                                vc.goToTabbar()
                            } else {
                                FirebaseAPI.shared.uploadVersion()
                                FirebaseAPI.shared.updateLastAuth()
                                FirebaseAPI.shared.uploadCreatedDate()
                                FirebaseAPI.shared.uploadUserData(withFirstName: "LockIt", withLastName: "User", withEmail: result!.user.email!, withUser: result!.user) { success, message in
                                    if success {
                                        vc.hideLoading()
                                        vc.goToBiometricsConfig()
                                    } else {
                                        vc.hideLoading()
                                        vc.showErrorAlert(withTitle: "Error", withDescription: message)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}
