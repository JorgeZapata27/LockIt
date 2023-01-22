//
//  Card.swift
//  LockIt
//
//  Created by JJ Zapata on 1/21/23.
//

import Foundation
import FirebaseDatabase

class Card {
    
    var name: String?
    var cardNumber: String?
    var expDate: String?
    var cvv: String?
    var holderName: String?
    var cardType: CardType?
    var brand: String?
    var isFavorite: Bool?
    var dateAdded: String?
    var lastUpdated: String?
    var cardColor: UIColor?
    
    init(withSnapshot snapshot: DataSnapshot) {
        if let value = snapshot.value as? [String : Any] {
            self.name = value["name"] as? String
            self.cardNumber = value["cardNumber"] as? String ?? "null"
            self.expDate = value["expDate"] as? String ?? "null"
            self.cvv = value["cvv"] as? String ?? "null"
            self.holderName = value["holderName"] as? String ?? "null"
            self.cardType = getCardType(type: value["cardType"] as? String ?? "unknown")
            self.isFavorite = value["isFavorite"] as? Bool ?? false
            self.brand = value["brand"] as? String ?? "null"
            self.dateAdded = value["dateAdded"] as? String ?? "error"
            self.lastUpdated = value["lastUpdated"] as? String ?? "error"
            self.cardColor = UIColor(hex: value["color"] as? String ?? "#F1C40F")
        }
    }
    
    init(name: String?, cardNum: String?) {
        self.name = name
        self.cardNumber = cardNum
    }
    
    func getCardType(type: String) -> CardType {
        switch type {
        case "credit":
            return .credit
        case "debit":
            return .debit
        case "other":
            return .other
        case "unknown":
            return .unknown
        default:
            return .unknown
        }
    }
    
    func getCardTypeString(type: CardType) -> String {
        switch type {
        case .credit:
            return "credit"
        case .debit:
            return "debit"
        case .other:
            return "other"
        case .unknown:
            return "unknown"
        default:
            return "unknown"
        }
    }
    
}
