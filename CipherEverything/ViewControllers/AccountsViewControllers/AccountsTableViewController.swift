//
//  AccountsTableViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import UIKit

protocol AddNewAccountViewControllerDelegate {
    func updateTable()
}

class AccountsTableViewController: UITableViewController {
    
    // MARK: - Public Properties
    var dataManager: Person!
    var personsAccounts = Users.usersData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsAccounts.users[dataManager.usersID].accounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = personsAccounts.users[dataManager.usersID].accounts[indexPath.row].website
        content.image = UIImage(systemName: "key")
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            showAlert(
                title: "Warning!",
                message: "Do you really want to delete account?",
                account: indexPath.row
            )
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addAccountVC = segue.destination as? AddNewAccountViewController {
            addAccountVC.delegate = self
            addAccountVC.dataManager = dataManager
        }
        
        guard let editAccountVC = segue.destination as? EditAccountViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
        editAccountVC.account = personsAccounts.users[dataManager.usersID].accounts[indexPath.row]
    }
}

// MARK: - Alert
extension AccountsTableViewController {
    private func showAlert(title: String, message massage: String, account: Int) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.personsAccounts.users[self.dataManager.usersID].accounts.remove(at: account)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Delegate
extension AccountsTableViewController: AddNewAccountViewControllerDelegate {
    func updateTable() {
        tableView.reloadData()
    }
}
