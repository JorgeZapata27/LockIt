//
//  Dates.swift
//  LockIt
//
//  Created by JJ Zapata on 11/25/22.
//

import Foundation

class Dates {
    
    static let shared = Dates()
    
    func getTodayISO() -> String  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.calendar = Calendar(identifier: .gregorian)
        let iso8601String = formatter.string(from: Date())
        return iso8601String
    }
    
}
