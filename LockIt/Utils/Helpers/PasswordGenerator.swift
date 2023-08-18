//
//  PasswordGenerator.swift
//  LockIt
//
//  Created by JJ Zapata on 11/26/22.
//

import Foundation

class PasswordGenerator {
    
    func generate(withLength length: Int, hasNumbers: Bool, hasLetters: Bool, hasCharacters: Bool) -> String {
        var list = ""
        var thePassword = ""
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let numbers = "0123456789"
        let characters = "!@#*$%?&()"
        
        
        if hasNumbers {
            list.append(numbers)
        }
        
        if hasLetters {
            list.append(letters)
        }
        
        if hasCharacters {
            list.append(characters)
        }
        
        if list == "" {
            return "error"
        } else {
            for _ in 0 ..< length {
                thePassword.append(list.randomElement()!)
            }
            
            return thePassword
        }
    }
    
}
