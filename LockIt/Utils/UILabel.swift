//
//  UILabel.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import Foundation
import UIKit

extension UILabel {

    // MARK: - spacingValue is spacing that you need
    func addInterlineSpacing(spacingValue: CGFloat = 2) {

        // Check if there's any text
        guard let textString = text else { return }

        // Create "NSMutableAttributedString" with your text
        let attributedString = NSMutableAttributedString(string: textString)

        // Create instance of "NSMutableParagraphStyle"
        let paragraphStyle = NSMutableParagraphStyle()

        // Actually adding spacing we need to ParagraphStyle
        paragraphStyle.lineSpacing = spacingValue

        // Adding ParagraphStyle to your attributed String
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))

        // Assign string that you've modified to current attributed Text
        attributedText = attributedString
    }

}

