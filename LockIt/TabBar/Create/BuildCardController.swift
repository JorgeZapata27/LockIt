//
//  BuildCardController.swift
//  LockIt
//
//  Created by JZ M1 on 15.08.23.
//

import Foundation
import UIKit
import CreditCardView

class BuildCardController: UIViewController {
    
    // MARK: - Variables
    var name = ""
    var cardNumber = ""
    var expDate = ""
    var cvv = ""
    var zipcode = ""
    let colors = ["LockIt Yellow", "Blue", "Green", "Red"]
    var color = "yellow"
    var type : CardType = .unknown
    let types = ["Credit", "Debit", "Unknown"]
    
    // MARK: - UI Components
    let promptLabel = UILabel()
    var card : CreditCardView?
    let typeTF = NormalTextField()
    let nicknameTF = NormalTextField()
    let cardColorTF = NormalTextField()
    let nextButton = MainButton(named: "Add Card")
    
    let cardPickerView = UIPickerView()
    let typePickerView = UIPickerView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Add"
        
        addBarView()
        setupPicker()
    }
    
    // MARK: - Styling
    func style() {
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.text = "Customize your card"
        promptLabel.textColor = normalTextColor
        promptLabel.textAlignment = .center
        promptLabel.font = .systemFont(ofSize: 12)
        
        card = CreditCardView(frame: CGRect(x: 16, y: 85, width: self.view.frame.size.width - 32, height: 185), template: .Curve(.systemYellow, .systemOrange, .systemGray2, .systemGray4, .black))
        card!.nameLabel.text = name
        card!.expLabel.text = expDate
        card!.numLabel.text = cardNumber
        card!.brandLabel.text = ""
        card!.brandImageView.image = UIImage()
        
        typeTF.translatesAutoresizingMaskIntoConstraints = false
        typeTF.textField.placeholder = "Card Type (Unknown)"
        typeTF.textField.tintColor = yellowColor
        
        nicknameTF.translatesAutoresizingMaskIntoConstraints = false
        nicknameTF.textField.placeholder = "Card Nickname (Optional)"
        nicknameTF.textField.tintColor = yellowColor
        
        cardColorTF.translatesAutoresizingMaskIntoConstraints = false
        cardColorTF.textField.placeholder = "Card Color (Choose)"
        cardColorTF.textField.tintColor = yellowColor
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Layout
    func layout() {
        view.addSubview(promptLabel)
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 42),
            promptLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            promptLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            promptLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        view.addSubview(card!)
        
        view.addSubview(typeTF)
        NSLayoutConstraint.activate([
            typeTF.topAnchor.constraint(equalTo: card!.bottomAnchor, constant: 18),
            typeTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            typeTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            typeTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        view.addSubview(nicknameTF)
        NSLayoutConstraint.activate([
            nicknameTF.topAnchor.constraint(equalTo: typeTF.bottomAnchor, constant: 14),
            nicknameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nicknameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nicknameTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        view.addSubview(cardColorTF)
        NSLayoutConstraint.activate([
            cardColorTF.topAnchor.constraint(equalTo: nicknameTF.bottomAnchor, constant: 14),
            cardColorTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            cardColorTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            cardColorTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: cardColorTF.bottomAnchor, constant: 19),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    // MARK: - Functions
    
    @objc func nextButtonTapped() {
        showLoading()
        FirebaseAPI.shared.addCard(withName: name, withNumber: cardNumber, withDate: expDate, withCVV: cvv, withZipcode: zipcode, withColor: color, withType: type, withNickname: nicknameTF.textField.text)
        hideLoading()
        self.dismiss(animated: true)
        self.dismiss(animated: true)
    }
    
    private func setupPicker() {
        cardPickerView.delegate = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolbar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerDoneTapped))
        
        toolbar.setItems([button], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        cardColorTF.textField.inputView = cardPickerView
        cardColorTF.textField.inputAccessoryView = toolbar
    }
    
    private func setupPicker2() {
        typePickerView.delegate = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolbar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerDoneTapped))
        
        toolbar.setItems([button], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        typeTF.textField.inputView = typePickerView
        typeTF.textField.inputAccessoryView = toolbar
    }
    
    @objc func pickerDoneTapped() {
        view.endEditing(true)
    }
    
    private func changeType(_ int: Int) {
        switch int {
        case 0:
            type = .credit
        case 1:
            type = .debit
        case 2:
            type = .other
        default:
            type = .unknown
            return
        }
    }
    
    private func changeColor(_ int: Int) {
        switch int {
        case 0:
            let card = CreditCardView(frame: CGRect(x: 16, y: 85, width: self.view.frame.size.width - 32, height: 185), template: .Curve(.systemYellow, .systemOrange, .systemGray2, .systemGray4, .black))
            card.nameLabel.text = name
            card.expLabel.text = expDate
            card.numLabel.text = cardNumber
            card.brandLabel.text = ""
            card.brandImageView.image = UIImage()
            color = "yellow"
            view.addSubview(card)
        case 1:
            let card = CreditCardView(frame: CGRect(x: 16, y: 85, width: self.view.frame.size.width - 32, height: 185), template: .Curve(blue1, blue2, .systemGray2, .systemGray4, .black))
            card.nameLabel.text = name
            card.expLabel.text = expDate
            card.numLabel.text = cardNumber
            card.brandLabel.text = ""
            card.brandImageView.image = UIImage()
            view.addSubview(card)
            color = "blue"
        case 2:
            let card = CreditCardView(frame: CGRect(x: 16, y: 85, width: self.view.frame.size.width - 32, height: 185), template: .Curve(green1, green2, .systemGray2, .systemGray4, .black))
            card.nameLabel.text = name
            card.expLabel.text = expDate
            card.numLabel.text = cardNumber
            card.brandLabel.text = ""
            card.brandImageView.image = UIImage()
            color = "green"
            view.addSubview(card)
        case 3:
            let card = CreditCardView(frame: CGRect(x: 16, y: 85, width: self.view.frame.size.width - 32, height: 185), template: .Curve(red1, red2, .systemGray2, .systemGray4, .black))
            card.nameLabel.text = name
            card.expLabel.text = expDate
            card.numLabel.text = cardNumber
            card.brandLabel.text = ""
            card.brandImageView.image = UIImage()
            color = "red"
            view.addSubview(card)
        default:
            return
        }
    }
    
}

extension BuildCardController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cardPickerView {
            return colors.count
        } else {
            return types.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cardPickerView {
            return colors[row]
        } else {
            return types[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cardPickerView {
            changeColor(row)
        } else {
            changeType(row)
        }
    }
    
}
