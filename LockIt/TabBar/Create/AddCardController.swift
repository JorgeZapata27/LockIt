//
//  AddCardController.swift
//  LockIt
//
//  Created by JZ M1 on 09.08.23.
//

import Foundation
import UIKit
import TextFieldFormatter

class AddCardController: UIViewController {
    
    // MARK: - Variables
    let months = ["January (01)", "February (02)", "March (03)", "April (04)", "May (05)", "June (06)", "July (07)", "August (08)", "September (09)", "October (10)", "November (11)", "December (12)"]
    let years = ["2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036", "2037", "2038", "2039", "2040", "2041", "2042", "2043", "2044"]
    
    // MARK: - UI Components
    let promptLabel = UILabel()
    let scrollView = UIScrollView()
    let cardHolderNameTF = NormalTextField()
    let cardNumberTF = CardTextField()
    let expDateTF = NormalTextField()
    let cvvTF = NormalTextField()
    let zipcodeTF = NormalTextField()
    let nextButton = MainButton(named: "Next")
    
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
        
        setupPicker()
    }
    
    // MARK: - Styling
    func style() {
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.text = "Enter your card details"
        promptLabel.textColor = normalTextColor
        promptLabel.textAlignment = .center
        promptLabel.font = .systemFont(ofSize: 12)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 850)
        scrollView.showsVerticalScrollIndicator = false
        
        cardHolderNameTF.translatesAutoresizingMaskIntoConstraints = false
        cardHolderNameTF.textField.placeholder = "Card Holder Name"
        cardHolderNameTF.textField.tintColor = yellowColor
        cardHolderNameTF.textField.autocapitalizationType = .words
//        cardHolderNameTF.textField.delegate = self
        
        cardNumberTF.translatesAutoresizingMaskIntoConstraints = false
        cardNumberTF.textField.placeholder = "Card Number"
        cardNumberTF.textField.tintColor = yellowColor
        cardNumberTF.textField.keyboardType = .numberPad
//        cardNumberTF.text
//        cardNumberTF.textField.delegate = self
        // formatter
        
        expDateTF.translatesAutoresizingMaskIntoConstraints = false
        expDateTF.textField.placeholder = "Exp. Date"
        expDateTF.textField.tintColor = yellowColor
//        expDateTF.textField.delegate = self
        // date picker
        
        cvvTF.translatesAutoresizingMaskIntoConstraints = false
        cvvTF.textField.placeholder = "CVC/CVV"
        cvvTF.textField.tintColor = yellowColor
        cvvTF.textField.keyboardType = .numberPad
//        cvvTF.textField.delegate = self
        
        zipcodeTF.translatesAutoresizingMaskIntoConstraints = false
        zipcodeTF.textField.placeholder = "Zipcode"
        zipcodeTF.textField.tintColor = yellowColor
        zipcodeTF.textField.keyboardType = .numberPad
//        zipcodeTF.textField.delegate = self
        
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
            // height is already configured in view class
        ])
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 26),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(cardHolderNameTF)
        NSLayoutConstraint.activate([
            cardHolderNameTF.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardHolderNameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            cardHolderNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            cardHolderNameTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        scrollView.addSubview(cardNumberTF)
        NSLayoutConstraint.activate([
            cardNumberTF.topAnchor.constraint(equalTo: cardHolderNameTF.bottomAnchor, constant: 14),
            cardNumberTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            cardNumberTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            cardNumberTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        scrollView.addSubview(expDateTF)
        NSLayoutConstraint.activate([
            expDateTF.topAnchor.constraint(equalTo: cardNumberTF.bottomAnchor, constant: 14),
            expDateTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            expDateTF.widthAnchor.constraint(equalToConstant: (self.view.frame.size.width - 46) / 2),
            expDateTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        scrollView.addSubview(cvvTF)
        NSLayoutConstraint.activate([
            cvvTF.topAnchor.constraint(equalTo: cardNumberTF.bottomAnchor, constant: 14),
            cvvTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            cvvTF.widthAnchor.constraint(equalToConstant: (self.view.frame.size.width - 46) / 2),
            cvvTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        scrollView.addSubview(zipcodeTF)
        NSLayoutConstraint.activate([
            zipcodeTF.topAnchor.constraint(equalTo: cvvTF.bottomAnchor, constant: 14),
            zipcodeTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            zipcodeTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            zipcodeTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        scrollView.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: zipcodeTF.bottomAnchor, constant: 19),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    // MARK: - Functions
    
    @objc func nextButtonTapped() {
        if cardHolderNameTF.textField.text == "" || cardNumberTF.textField.text == "" || expDateTF.textField.text == "" || cvvTF.textField.text == "" || zipcodeTF.textField.text == "" {
            self.showErrorAlert(withTitle: "Error", withDescription: "Please enter all values of the card")
            return
        }
        let controller = BuildCardController()
        controller.name = cardHolderNameTF.textField.text!
        controller.cardNumber = cardNumberTF.textField.text!
        controller.expDate = expDateTF.textField.text!
        controller.cvv = cvvTF.textField.text!
        controller.zipcode = zipcodeTF.textField.text!
        self.present(controller, animated: true)
    }
    
    private func setupPicker() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolbar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerDoneTapped))
        
        toolbar.setItems([button], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        expDateTF.textField.inputView = pickerView
        expDateTF.textField.inputAccessoryView = toolbar
    }
    
    @objc func pickerDoneTapped() {
        view.endEditing(true)
    }
    
}

extension AddCardController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == cardHolderNameTF.textField {
            cardNumberTF.textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}

extension AddCardController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 12
        case 1:
            return 15
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width / 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return years[row]
        default:
            return "error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let month = pickerView.selectedRow(inComponent: 0)
        let year = years[pickerView.selectedRow(inComponent: 1)]
        var monthString = ""
        let yearString = year.suffix(2)
        switch month {
        case 0:
            monthString = "01"
        case 1:
            monthString = "02"
        case 2:
            monthString = "03"
        case 3:
            monthString = "04"
        case 4:
            monthString = "05"
        case 5:
            monthString = "06"
        case 6:
            monthString = "07"
        case 7:
            monthString = "08"
        case 8:
            monthString = "09"
        case 9:
            monthString = "10"
        case 10:
            monthString = "11"
        case 11:
            monthString = "12"
        default:
            monthString = "error"
        }
        expDateTF.textField.text = "\(monthString)/\(yearString)"
        
    }
    
}
