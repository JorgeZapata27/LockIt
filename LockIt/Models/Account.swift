//
//  Account.swift
//  LockIt
//
//  Created by JZ M1 on 06.01.23.
//

import Foundation
import FirebaseDatabase

class Account {
    
    var name: String?
    var username: String?
    var password: String?
    var thirdParty: String?
    var imageURL: String?
    var isFavorite: Bool?
    var strength: StrengthType?
    var dateAdded: String?
    var lastUpdated: String?
    
    init(withSnapshot snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String : Any] {
            self.name = value["name"] as? String
            self.username = value["username"] as? String
            self.password = value["password"] as? String
            self.thirdParty = value["thirdParty"] as? String ?? "null"
            self.imageURL = value["imageURL"] as? String ?? "null"
            self.isFavorite = value["isFavorite"] as? Bool ?? false
            self.strength = getStrength(strength: value["strength"] as? String ?? "unable")
            self.dateAdded = value["dateAdded"] as? String ?? "error"
            self.lastUpdated = value["lastUpdated"] as? String ?? "error"
        }
    }
    
    init(name: String?, username: String?) {
        self.name = name
        self.username = username
    }
    
    func getStrength(strength: String) -> StrengthType {
        switch strength {
        case "weak":
            return.weak
        case "fair":
            return .fair
        case "strong":
            return .strong
        case "error":
            return .unable
        default:
            return .unable
        }
    }
    
}
