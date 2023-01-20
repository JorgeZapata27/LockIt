//
//  AccountsViewController.swift
//  LockIt
//
//  Created by JZ M1 on 30.12.22.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class AccountsViewController : UIViewController {
    
    // MARK: - Variables
    var accounts = [Account]()
    
    // MARK: - UI Components
    let tableView = UITableView()
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

extension AccountsViewController {
    
    // MARK: - General
    func general() {
        view.backgroundColor = normalBackgroundColor
        navigationItem.title = "Accounts"
        
        // Table View
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Styling
    func style() {
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        searchTF.textField.placeholder = "Search"
        searchTF.textField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(AccountCell.self, forCellReuseIdentifier: AccountCell.reuseID)
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
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchTF.bottomAnchor, constant: 19 ),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Backend
    func backend() {
        accounts.removeAll()
        FirebaseAPI.shared.getAccounts { accounts in
            self.accounts = accounts
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Functions
    
}

extension AccountsViewController: UITableViewDelegate {
    
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

extension AccountsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.reuseID, for: indexPath) as! AccountCell
        cell.account = accounts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
        let controller = AccountViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension AccountsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
