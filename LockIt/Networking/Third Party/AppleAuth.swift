//
//  AppleAuth.swift
//  LockIt
//
//  Created by JJ Zapata on 11/23/22.
//

import Foundation
import CryptoKit
import FirebaseAuth
import FirebaseDatabase
import AuthenticationServices

// MARK: - General

var currentNonce: String?

class AppleAuth {
    
    static let shared = AppleAuth()
    
    func startProcess(withVC vc: UIViewController) {
        let nonce = self.randomNonceString()
        currentNonce = nonce
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        
        request.requestedScopes = [.fullName, .email]
        request.nonce = self.sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = vc as? any ASAuthorizationControllerDelegate
        authorizationController.presentationContextProvider = vc as? any ASAuthorizationControllerPresentationContextProviding
        authorizationController.performRequests()
    }
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        return hashString
    }
    
    func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        return result
    }
    
}

// MARK: - SignUpViewcontroller

extension SignUpViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        showLoading()
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Invalid state: A login callback was received, but no login request was sent.")
                return
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
                let _ = appleIDCredential.fullName
                
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        self.hideLoading()
                        self.showErrorAlert(withTitle: "Error", withDescription: error.localizedDescription)
                        return
                    } else {
                        if Auth.auth().currentUser != nil {
                            FirebaseAPI.shared.updateLastAuth()
                            Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: DataEventType.value) { (snapshot) in
                                if snapshot.exists() {
                                    FirebaseAPI.shared.uploadVersion()
                                    self.hideLoading()
                                    self.goToTabbar()
                                } else {
                                    FirebaseAPI.shared.uploadVersion()
                                    FirebaseAPI.shared.uploadCreatedDate()
                                    self.hideLoading()
                                    FirebaseAPI.shared.uploadUserData(withFirstName: "LockIt", withLastName: "User", withEmail: authResult!.user.email!, withUser: authResult!.user) { success, errorMessage in
                                        if success {
                                            self.goToBiometricsConfig()
                                        } else {
                                            self.showErrorAlert(withTitle: "Error", withDescription: errorMessage)
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
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign in with Apple errored: \(error)")
        showErrorAlert(withTitle: "Error", withDescription: error.localizedDescription)
    }
    
}

// MARK: - LoginViewController


extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        showLoading()
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Invalid state: A login callback was received, but no login request was sent.")
                return
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                hideLoading()
                showErrorAlert(withTitle: "Error", withDescription: "Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
                let _ = appleIDCredential.fullName
                
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        self.hideLoading()
                        self.showErrorAlert(withTitle: "Error", withDescription: error.localizedDescription)
                        return
                    } else {
                        if Auth.auth().currentUser != nil {
                            Database.database().reference().child("Users").child(Auth.auth().currentUser!.uid).observeSingleEvent(of: DataEventType.value) { (snapshot) in
                                if snapshot.exists() {
                                    FirebaseAPI.shared.uploadVersion()
                                    FirebaseAPI.shared.updateLastAuth()
                                    self.hideLoading()
                                    self.goToTabbar()
                                } else {
                                    FirebaseAPI.shared.uploadVersion()
                                    FirebaseAPI.shared.updateLastAuth()
                                    FirebaseAPI.shared.uploadCreatedDate()
                                    self.hideLoading()
                                    self.goToTabbar()
                                    FirebaseAPI.shared.uploadUserData(withFirstName: "LockIt", withLastName: "User", withEmail: authResult!.user.email!, withUser: authResult!.user) { success, errorMessage in
                                        if success {
                                            self.goToBiometricsConfig()
                                        } else {
                                            self.showErrorAlert(withTitle: "Error", withDescription: errorMessage)
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
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign in with Apple errored: \(error)")
        showErrorAlert(withTitle: "Error", withDescription: error.localizedDescription)
    }
    
}
