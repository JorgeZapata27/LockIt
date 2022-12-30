//
//  HomeViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
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
        addBarView()
    }
    
    // MARK: - Styling
    func style() {
        // 
    }
    
    
    // MARK: - Layout
    func layout() {
        //
    }
    
    // MARK: - Functions
    
}
