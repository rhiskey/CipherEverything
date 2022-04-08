//
//  AddNewAccountViewController.swift
//  CipherEverything
//
//  Created by Евгений Волошенко on 06.04.2022.
//

import UIKit

class AddNewAccountViewController: UIViewController, UITextFieldDelegate, PasswordCheckerProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckLabel: UILabel!
    
    // MARK: - Public Properties
    var delegate: AccountsTableViewController!
    var dataManager: DataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        websiteTextField.becomeFirstResponder()
        
        passwordCheckLabel.text = ""
        
        passwordTextField.delegate = self
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    // MARK: - IBActions
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        passwordRegularExpressionCheck(for: passwordTextField.text ?? "")
    }
    
    @IBAction func addPressed(_ sender: Any) {
        guard websiteTextField.text != "" else { return }
        guard let website = websiteTextField.text,
              let password = passwordTextField.text else { return }
        
        let newAccount = Account(website: website,
                                 password: password)
        
        dataManager.addNew(account: newAccount)
        delegate.updateTable()
        dismiss(animated: true)
    }
}

// MARK: - Password Checker
extension AddNewAccountViewController {
    func passwordRegularExpressionCheck(for text: String) {
        if (isValidPassword(text)) {
            passwordCheckLabel.text = "Strong password!"
            passwordCheckLabel.textColor = .systemGreen
        } else {
            passwordCheckLabel.text = "Weak password!"
            passwordCheckLabel.textColor = .systemRed
        }
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        // min 8 characters total
        let password = password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}

// MARK: - UITextFieldDelegate
extension AddNewAccountViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
        passwordRegularExpressionCheck(for: passwordTextField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == websiteTextField  {
            passwordTextField.becomeFirstResponder()
        } else {
            addPressed(passwordTextField ?? "")
        }
        return true
    }
}
