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
    var dateAddedString: String?
    
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
            
            self.setDateString()
        }
    }
    
    init() {
        //
    }
    
    init(name: String?, username: String?) {
        self.name = name
        self.username = username
    }
    
    func setDateString() {
        let DBformatter = DateFormatter()
        DBformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let mobileFormatter = DateFormatter()
        mobileFormatter.dateFormat = "E, MMMM d, yyyy"
        let date = DBformatter.date(from: dateAdded!)
        
        dateAddedString = mobileFormatter.string(from: date!)
    }
    
    func getStrength(strength: String) -> StrengthType {
        switch strength.lowercased() {
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
    
    func getStrengthColor() -> UIColor {
        switch strength {
        case .weak:
            return .systemRed
        case .fair:
            return .systemBlue
        case .strong:
            return .systemGreen
        case .unable:
            return .systemRed
        default:
            return .systemRed
        }
    }
    
}
