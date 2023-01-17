//
//  AccountButton.swift
//  LockIt
//
//  Created by JZ M1 on 06.01.23.
//

import Foundation
import UIKit

class AccountButton: UIButton {
    
    let label = UILabel()
    let iconImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sharedLayout()
    }
    
    init(named title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: [])
        setTitleColor(normalTextColor, for: [])
        sharedLayout()
    }
    
    init(withThirdParty thirdParty: ThirdParty) {
        super.init(frame: .zero)
        
        sharedLayout()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = normalTextColor
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        
        switch thirdParty {
        case ThirdParty.apple:
            label.text = "Apple"
            iconImageView.image = UIImage(named: "apple")
        case ThirdParty.google:
            label.text = "Google"
            iconImageView.image = UIImage(named: "google")
        }
        
        addSubview(label)
        addSubview(iconImageView)
        clipsToBounds = true
        
        self.backgroundColor = secondaryBackgroundColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.sizeToFit()
        let iconSize: CGFloat = 18
        let iconX: CGFloat = (frame.size.width - label.frame.size.width - iconSize - 5) / 2
        iconImageView.frame = CGRect(x: iconX, y: (frame.size.height - iconSize) / 2, width: iconSize, height: iconSize)
        label.frame = CGRect(x: iconX + iconSize + 5, y: 0, width: label.frame.size.width, height: frame.size.height)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        sharedLayout()
    }
    
    private func sharedLayout() {
        
        addTarget(self, action: #selector(hapticFeedback), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius = 8
        backgroundColor = yellowColor
        setTitleColor(normalBackgroundColor, for: [])
    }

}

extension AccountButton {
    
    @objc func hapticFeedback() {
        Haptic().medium()
    }
    
}

