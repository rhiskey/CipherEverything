//
//  EditPasswordViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import UIKit

class EditPasswordViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet var loginLB: UILabel!
    @IBOutlet var checkPasswordLB: UILabel!
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var editSwitch: UISwitch!
    
    // MARK: - Public Variables
    var account: Password!
    
    // MARK: - Private Variables
    private var passwordRegex = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTF.delegate = self
        
        title = account.website
//        loginLB.text = "Login: \(account.login)"
        passwordTF.text = account.password
        
        passwordRegularExpressionCheck(for: account.password)
    }
    
    // MARK: - IBActions
    @IBAction func editSwitched(_ sender: UISwitch) {
        if sender.isOn {
            passwordTF.isUserInteractionEnabled = true
        } else {
            passwordTF.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func checkPassword(_ sender: UITextField) {
        guard let text = sender.text else { return }
    
        passwordRegularExpressionCheck(for: text)
    }
    
    func passwordRegularExpressionCheck(for text: String) {
        if text.count > 8 {
            checkPasswordLB.text = "Strong password!"
            checkPasswordLB.textColor = .systemGreen
        } else {
            checkPasswordLB.text = "Weak password!"
            checkPasswordLB.textColor = .systemRed
        }
    }
}

extension EditPasswordViewController {
    // MARK: - Public Methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == passwordTF && !editSwitch.isOn {
            return false;
        }
        return true
    }
}
