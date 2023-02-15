//
//  SettingsView.swift
//  LockIt
//
//  Created by JZ M1 on 05.01.23.
//

import StoreKit
import Foundation
import UIKit

class SettingsView: UIView {
    
    var height: Int?
    var options = [SettingsOption]()
    var vc: UIViewController?
    let tableView = UITableView()
    
    init(height: Int, options: [SettingsOption], tag: Int, vc: UIViewController) {
        super.init(frame: .zero)
        
        self.height = height
        self.options = options
        self.vc = vc
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = secondaryBackgroundColor
        layer.cornerRadius = 10
        heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        
        configureTable(withTag: tag)
    }
    
    func configureTable(withTag tag: Int) {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "REUSE")
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.tag = tag
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("opyt")
        print(options.count)
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "REUSE", for: indexPath)
        cell.textLabel!.text = options[indexPath.row].titleText
        cell.selectionStyle = .none
        cell.textLabel!.font = .systemFont(ofSize: 14)
        cell.backgroundColor = .clear
        
        if cell.textLabel?.text != "App Version" {
            let arrow = UIImageView()
            arrow.translatesAutoresizingMaskIntoConstraints = false
            arrow.image = UIImage(named: "arrow")
            cell.addSubview(arrow)
            NSLayoutConstraint.activate([
                arrow.heightAnchor.constraint(equalToConstant: 13),
                arrow.widthAnchor.constraint(equalToConstant: 13),
                arrow.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -17),
                arrow.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
            ])
        } else {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "4.0.0"
            label.font = .systemFont(ofSize: 14)
            label.textAlignment = .right
            label.textColor = secondaryTextColor
            cell.addSubview(label)
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalToConstant: 13),
                label.widthAnchor.constraint(equalToConstant: 140),
                label.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -17),
                label.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
            ])
        }
        
        if cell.textLabel?.text == "Sign Out" {
            cell.textLabel!.textColor = UIColor(named: "red")
            cell.textLabel!.font = .boldSystemFont(ofSize: 14)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 31
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            switch indexPath.row {
            case 0:
                print("Current app version is 1.0.0")
            case 1:
                rateUs()
            case 2:
                shareLockIt()
            default:
                break
            }
        } else if tableView.tag == 1 {
            switch indexPath.row {
            case 0:
                vc?.showErrorAlert(withTitle: "Coming Soon", withDescription: "The Privacy Policy is coming soon")
            case 1:
                vc?.showErrorAlert(withTitle: "Coming Soon", withDescription: "The Terms and Conditions are coming soon")
            default:
                break;
            }
        } else if tableView.tag == 2 {
            signOut()
        }
    }
    
    private func shareLockIt() {
        print("share lockit")
        let textToShare = "You need to check out LockIt, it safely secures your passwords and cards so YOU don't have to!"
        if let myWebsite = NSURL(string: "https://appstoreconnect.apple.com/apps/1470154470/appstore/info") {
            let objectsToShare: [Any] = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = vc?.view ?? UIView()
            vc!.present(activityVC, animated: true, completion: nil)
        }
    }
    
    private func rateUs() {
        guard let scene = UIApplication.shared.foregroundActiveScene else { return }
        SKStoreReviewController.requestReview(in: scene)
    }
    
    private func signOut() {
        let alert = UIAlertController(title: "Sign Out", message: "Are you sure you want to sign out?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes, Sign Out", style: .destructive, handler: { action in
            FirebaseAPI.shared.logUserOut { success in
                if success {
                    let controller = LoginViewController()
                    controller.modalPresentationStyle = .fullScreen
                    self.vc?.present(controller, animated: true)
                } else {
                    self.vc?.showErrorAlert(withTitle: "Error", withDescription: "Please try again")
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "No, Cancel", style: .default, handler: { action in
            print("cancelled")
        }))
        vc?.present(alert, animated: true)
    }
    
}
