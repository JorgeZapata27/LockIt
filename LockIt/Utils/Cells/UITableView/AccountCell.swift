//
//  AccountCell.swift
//  LockIt
//
//  Created by JZ M1 on 30.12.22.
//

import UIKit

class AccountCell: UITableViewCell {
    
    var account : Account? {
        didSet {
            // customize didset
            if let account = account {
                if let name = account.name {
                    titleLabel.text = name
                }
                if let username = account.username {
                    miniLabel.text = username
                }
                if let url = account.imageURL {
                    iconImageView.loadThumbnail(urlSting: url)
                }
            }
            // set random account via cellForRowAt
            // make array
        }
    }
    
    static let reuseID = "AccountCellID"
    let reuseID = "AccountCellID"
    
    let theBackgroundView = UIView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let miniLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("awake from nib")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styleUp()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleUp() {
        selectionStyle = .none
        backgroundColor = .clear
        
        theBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        theBackgroundView.backgroundColor = secondaryBackgroundColor
        theBackgroundView.layer.cornerRadius = 8
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.layer.cornerRadius = 10
        iconImageView.backgroundColor = normalBackgroundColor
        iconImageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 12)
        titleLabel.textColor = normalTextColor
        titleLabel.textAlignment = .left
        
        miniLabel.translatesAutoresizingMaskIntoConstraints = false
        miniLabel.font = .systemFont(ofSize: 12)
        miniLabel.textColor = secondaryTextColor
        miniLabel.textAlignment = .left
    }
    
    private func layout() {
        addSubview(theBackgroundView)
        NSLayoutConstraint.activate([
            theBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 4.5),
            theBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            theBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            theBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4.5)
        ])
        
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leftAnchor.constraint(equalTo: theBackgroundView.leftAnchor, constant: 17),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        addSubview(miniLabel)
        NSLayoutConstraint.activate([
            miniLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            miniLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12),
            miniLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            miniLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

}
