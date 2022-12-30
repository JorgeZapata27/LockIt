//
//  FavoritesViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
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

extension FavoritesViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Favorites"
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
