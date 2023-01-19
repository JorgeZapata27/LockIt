//
//  TabBarController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = yellowColor
        hidesBottomBarWhenPushed = true
        
        setupVCs()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: HomeViewController(), image: UIImage(systemName: "house")!),
            createNavController(for: FavoritesViewController(), image: UIImage(systemName: "heart")!),
            createNavController(for: AddViewController(), image: UIImage(systemName: "plus")!),
            createNavController(for: GeneratorViewController(), image: UIImage(systemName: "character")!),
            createNavController(for: SettingsViewController(), image: UIImage(systemName: "person")!)
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
