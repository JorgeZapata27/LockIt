//
//  CardsViewController.swift
//  LockIt
//
//  Created by JZ M1 on 03.01.23.
//

import Foundation
import UIKit

class CardsViewController : UIViewController {
    
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

extension CardsViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = normalBackgroundColor
        navigationItem.title = "Cards"
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
