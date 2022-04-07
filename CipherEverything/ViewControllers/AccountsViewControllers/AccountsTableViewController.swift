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
        DataManager.shared.accounts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = DataManager.shared.accounts[indexPath.row].website
        content.image = UIImage(systemName: "key")
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let editAccountVC = segue.destination as? EditAccountViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
        editAccountVC.account = DataManager.shared.accounts[indexPath.row]
    }
}
