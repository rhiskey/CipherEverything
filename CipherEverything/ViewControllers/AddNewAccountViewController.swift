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
    
    @IBAction func addPressed(_ sender: Any) {
        guard websiteTextField.text != "" else { return }
        guard let website = websiteTextField.text,
              let password = passwordTextField.text else { return }
        
        DataManager.shared.addNew(account: Account(website: website,
                                                   password: password))
        // проверка на кол-во аккаунтов в массиве
        print(DataManager.shared.accounts.count)
    }
}
