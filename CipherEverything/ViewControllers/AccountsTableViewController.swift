//
//  AccountsTableViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import UIKit

protocol AddNewAccountViewControllerDelegate {
    func updateTable(with account: Account)
}

class AccountsTableViewController: UITableViewController {
    
    var accounts: [Account]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let account = accounts?[indexPath.row]
        
        content.text = account?.website
        content.image = UIImage(systemName: "key")
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let account = accounts?[indexPath.section]
        performSegue(withIdentifier: "showEditPassword", sender: account)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editAccountVC = segue.destination as? EditAccountViewController else { return }
        guard let addAccountVC = segue.destination as? AddNewAccountViewController else { return }
        editAccountVC.account = sender as? Account
        
        // TODO: Doesn't pass!!
        addAccountVC.delegate = self
    }
    
}

// MARK: - Add new account to table
extension AccountsTableViewController: AddNewAccountViewControllerDelegate {
    func updateTable(with account: Account) {
        self.accounts?.append(account)
        
        self.tableView.performBatchUpdates({
            self.tableView.insertRows(at: [IndexPath(row: (self.accounts?.count ?? 0) - 1,
                                                     section: 0)],
                                      with: .automatic)
        }, completion: nil)
    }
}
