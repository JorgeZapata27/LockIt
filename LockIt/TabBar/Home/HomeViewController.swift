//
//  HomeViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    var mainOptionView : MainOptionView?
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        
        // Do any additional setup after loading the view.
    }
    
}

extension HomeViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Home"
        navigationController?.navigationBar.tintColor = yellowColor
        addBarView()
        
        mainOptionView = MainOptionView(view: view, rootViewController: self)
    }
    
    // MARK: - Styling
    func style() {
        // Main Option View
        guard let mainOptionView = mainOptionView else { return }
        mainOptionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: - Layout
    func layout() {
        guard let mainOptionView = mainOptionView else { return }
        view.addSubview(mainOptionView)
        NSLayoutConstraint.activate([
            mainOptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            mainOptionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            mainOptionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            mainOptionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    // MARK: - Functions
    
}
