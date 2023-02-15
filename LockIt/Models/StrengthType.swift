//
//  StrengthType.swift
//  LockIt
//
//  Created by JJ Zapata on 1/19/23.
//

import Foundation
import UIKit

enum StrengthType {
    
    case strong, fair, weak, unable;
    
    func toString() -> String {
        switch self {
        case .strong:
            return "Strong"
        case .fair:
            return "Fair"
        case .weak:
            return "Weak"
        case .unable:
            return "Unable"
        default:
            return "Unable"
        }
    }
    
}
