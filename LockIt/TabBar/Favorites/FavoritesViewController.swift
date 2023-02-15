//
//  FavoritesViewController.swift
//  LockIt
//
//  Created by JJ Zapata on 11/22/22.
//

import UIKit
import CryptoKit

class FavoritesViewController: UIViewController {
    
    // MARK: - Variables
    var accounts = [Account]()
    var cards = [Card]()
    
    // MARK: - UI Components
    let segmentedControl = UISegmentedControl()
    let tableView = UITableView()
    var collectionView: UICollectionView?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        general()
        style()
        layout()
        backend()
        
        // Do any additional setup after loading the view.
    }
    
}

extension FavoritesViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = backgroundColor
        navigationItem.title = "Favorites"
        navigationController?.navigationBar.tintColor = yellowColor
        addBarView()
    }
    
    // MARK: - Styling
    func style() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = yellowColor
        segmentedControl.insertSegment(withTitle: "Accounts", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Cards", at: 1, animated: true)
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
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width - 16 - 16 - 16) / 2, height: (view.frame.size.width - 16 - 16) / 2)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView!.translatesAutoresizingMaskIntoConstraints = false
        collectionView!.backgroundColor = .clear
        collectionView!.register(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseID)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView?.alpha = 0
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
        
        view.addSubview(collectionView!)
        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            collectionView!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            collectionView!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
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
            self.collectionView!.alpha = 0
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
                    self.collectionView!.alpha = 1
                }
            }
        }
    }
    
    //MARK: - Backend
    
    func backend() {
        accountsBackend()
        cardsBackend()
    }
    
    func accountsBackend() {
        accounts.removeAll()
        FirebaseAPI.shared.getFavoriteAccounts { accounts in
            self.accounts = accounts
            self.tableView.reloadData()
        }
    }
    
    func cardsBackend() {
        cards.removeAll()
        FirebaseAPI.shared.getFavoriteCards { cards in
            self.cards = cards
            self.collectionView!.reloadData()
        }
    }
    
}

extension FavoritesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 81
    }
    
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.reuseID, for: indexPath) as! AccountCell
        cell.account = accounts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = AccountViewController()
        controller.account = accounts[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseID, for: indexPath) as! CardCell
        cell.card = cards[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected card")
    }
    
}
