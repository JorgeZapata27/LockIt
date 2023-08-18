//
//  AddAccountController.swift
//  LockIt
//
//  Created by JZ M1 on 09.08.23.
//

import Foundation
import UIKit

class AddAccountController: UIViewController {
    
    // MARK: - UI Components
    let promptLabel = UILabel()
    let segmentedControl = UISegmentedControl()
    let addAcountView = AddAccountView()
    
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
    }
    
    // MARK: - Styling
    func style() {
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.text = "Choose from"
        promptLabel.textColor = normalTextColor
        promptLabel.textAlignment = .center
        promptLabel.font = .systemFont(ofSize: 12)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = yellowColor
        segmentedControl.insertSegment(withTitle: "Our Accounts", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Create Your Own", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = yellowColor
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        
        addAcountView.translatesAutoresizingMaskIntoConstraints = false
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
        
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 76),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        view.addSubview(addAcountView)
        NSLayoutConstraint.activate([
            addAcountView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            addAcountView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            addAcountView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            addAcountView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Functions
    
    @objc func segmentedControlTapped(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            addAcountView.change(to: .ours)
        } else {
            addAcountView.change(to: .custom)
        }
    }
    
}
