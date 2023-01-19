//
//  FavoritesViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit
import CryptoKit

class FavoritesViewController: UIViewController {
    
    // MARK: - UI Components
    let segmentedControl = UISegmentedControl()
    let tableView = UITableView()
    let cardView = UIView()
    
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
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = yellowColor
        segmentedControl.insertSegment(withTitle: "Accounts", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Cards", at: 0, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = yellowColor
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(AccountCell.self, forCellReuseIdentifier: AccountCell.reuseID)
        tableView.alpha = 1
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = secondaryBackgroundColor
        cardView.layer.cornerRadius = 8
        cardView.alpha = 0
    }
    
    
    // MARK: - Layout
    func layout() {
        view.addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 9.5),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        view.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 9.5),
            cardView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            cardView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Functions
    
    @objc func segmentedControlTapped(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            showAccounts()
        } else {
            showCards()
        }
    }
    
    private func showAccounts() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
            self.cardView.alpha = 0
        } completion: { success in
            if (success) {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                    self.tableView.alpha = 1
                }
            }
        }
    }
    
    private func showCards() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
            self.tableView.alpha = 0
        } completion: { success in
            if (success) {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                    self.cardView.alpha = 1
                }
            }
        }
    }
    
}

extension FavoritesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.reuseID, for: indexPath) as! AccountCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
        // MARK: - Todo navigation
    }
    
}
