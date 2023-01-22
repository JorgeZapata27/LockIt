//
//  CardCell.swift
//  LockIt
//
//  Created by JJ Zapata on 1/21/23.
//

import Foundation
import UIKit

class CardCell: UICollectionViewCell {
    
    static let reuseID = "cardCellID"
    
    var card : Card? {
        didSet {
            if let card = card {
                if let cardType = card.cardType {
                    typeLabel.text = card.getCardTypeString(type: cardType).uppercased()
                }
                
                if let color = card.cardColor {
                    cardView.backgroundColor = color
                }
                
                if let title = card.name {
                    nameTitle.text = title
                }
                
                if let cardType = card.cardType, let brand = card.brand {
                    let cardTypeString = card.getCardTypeString(type: cardType)
                    secondaryTitle.font = .italicSystemFont(ofSize: 12)
                    secondaryTitle.text = "\(cardTypeString.capitalized) - \(brand)"
                }
                
                if let numbers = card.cardNumber {
                    let lastFour = numbers.suffix(4)
                    let string = NSMutableAttributedString(string: "Ends in ", attributes: [NSAttributedString.Key.foregroundColor: normalTextColor!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 9)])
                    string.append(NSAttributedString(string: String(lastFour), attributes: [NSAttributedString.Key.foregroundColor: normalTextColor!, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 9)]))
                    finalTitle.attributedText = string
                }
            }
        }
    }
    
    let typeLabel = UILabel()
    let cardView = UIView()
    let nameTitle = UILabel()
    let secondaryTitle = UILabel()
    let finalTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        styleUp()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleUp() {
        contentView.backgroundColor = secondaryBackgroundColor
        contentView.layer.cornerRadius = 8
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.textAlignment = .right
        typeLabel.textColor = normalTextColor
        typeLabel.font = .boldSystemFont(ofSize: 8)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = normalBackgroundColor
        cardView.layer.cornerRadius = 10
        
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.textAlignment = .center
        nameTitle.textColor = normalTextColor
        nameTitle.font = .boldSystemFont(ofSize: 12)
        
        secondaryTitle.translatesAutoresizingMaskIntoConstraints = false
        secondaryTitle.textAlignment = .center
        secondaryTitle.textColor = normalTextColor
        secondaryTitle.font = .boldSystemFont(ofSize: 8)
        
        finalTitle.translatesAutoresizingMaskIntoConstraints = false
        finalTitle.textAlignment = .center
        finalTitle.textColor = normalTextColor
        finalTitle.font = .boldSystemFont(ofSize: 9)
    }
    
    private func layout() {
        addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            typeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            typeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            typeLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 15),
            cardView.widthAnchor.constraint(equalToConstant: 100),
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 67)
        ])
        
        addSubview(nameTitle)
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 16),
            nameTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            nameTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            nameTitle.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        addSubview(secondaryTitle)
        NSLayoutConstraint.activate([
            secondaryTitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 4),
            secondaryTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            secondaryTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            secondaryTitle.heightAnchor.constraint(equalToConstant: 10)
        ])
        
        addSubview(finalTitle)
        NSLayoutConstraint.activate([
            finalTitle.topAnchor.constraint(equalTo: secondaryTitle.bottomAnchor, constant: 6),
            finalTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            finalTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            finalTitle.heightAnchor.constraint(equalToConstant: 11)
        ])
        
    }
    
}
