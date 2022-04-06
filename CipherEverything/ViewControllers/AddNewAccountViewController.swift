//
//  AddNewAccountViewController.swift
//  CipherEverything
//
//  Created by Евгений Волошенко on 06.04.2022.
//

import UIKit

class AddNewAccountViewController: UIViewController {

    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var delegate: AccountsTableViewController!
    
    @IBAction func addPressed(_ sender: Any) {
        guard websiteTextField.text != "" else { return }
        guard let website = websiteTextField.text,
              let password = passwordTextField.text else { return }
        
        let newAccount = Account(website: website,
                                       password: password)
        
        DataManager.shared.addNew(account: newAccount)
        
        delegate.updateTable(with: newAccount)
        
        // проверка на кол-во аккаунтов в массиве
        print(DataManager.shared.accounts.count)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
