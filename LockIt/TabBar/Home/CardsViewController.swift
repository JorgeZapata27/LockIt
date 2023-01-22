//
//  CardsViewController.swift
//  LockIt
//
//  Created by JZ M1 on 03.01.23.
//

import Foundation
import UIKit

class CardsViewController : UIViewController {
    
    // MARK: - Variables
    var cards = [Card]()
    
    // MARK: - UI Components
    var collectionView: UICollectionView?
    let searchTF = NormalTextField()
    
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

extension CardsViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = normalBackgroundColor
        navigationItem.title = "Cards"
    }
    
    // MARK: - Styling
    func style() {
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.textField.placeholder = "Search"
        searchTF.textField.delegate = self
        searchTF.textField.addTarget(self, action: #selector(searchHandler), for: .editingChanged)
        
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
    }
    
    
    // MARK: - Layout
    func layout() {
        view.addSubview(searchTF)
        NSLayoutConstraint.activate([
            searchTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4.5),
            searchTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            searchTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            searchTF.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        view.addSubview(collectionView!)
        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: searchTF.bottomAnchor, constant: 19 ),
            collectionView!.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            collectionView!.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    //MARK: - Backend
    
    func backend() {
        cards.removeAll()
        FirebaseAPI.shared.getCards { cards in
            self.cards = cards
            self.collectionView!.reloadData()
        }
    }
    
    // MARK: - Functions
    
    @objc func searchHandler() {
        if let searchText = searchTF.textField.text {
//            if searchText != "" {
//                accounts = accounts.filter({$0.name!.lowercased().contains(searchText.lowercased())})
//                tableView.reloadData()
//            } else {
//                backend()
//            }
        }
    }
    
}

extension CardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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

extension CardsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
