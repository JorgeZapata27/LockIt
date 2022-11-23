//
//  GeneratorViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class GeneratorViewController: UIViewController {
    
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

extension GeneratorViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Generator"
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
