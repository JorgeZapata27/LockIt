//
//  EmailValidator.swift
//  LockIt
//
//  Created by JJ Zapata on 11/14/22.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let minPasswordLength = 6
        return self.count >= minPasswordLength
    }
    
}
