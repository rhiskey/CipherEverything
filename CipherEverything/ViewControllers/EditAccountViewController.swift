//
//  EditAccountViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import UIKit

class EditAccountViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet var checkPasswordLB: UILabel!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var editSwitch: UISwitch!
    
    // MARK: - Public Variables
    var account: Account!
    
    // MARK: - Private Variables
    private var passwordRegex = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTF.delegate = self
        
        title = account.website
        passwordTF.text = account.password

        editSwitch.setOn(false, animated: false)
        
        passwordRegularExpressionCheck(for: account.password)
    }
    
    // MARK: - IBActions
    @IBAction func editSwitched(_ sender: UISwitch) {
        if sender.isOn {
            passwordTF.isUserInteractionEnabled = true
            passwordTF.isSecureTextEntry = false
        } else {
            passwordTF.isUserInteractionEnabled = false
            passwordTF.isSecureTextEntry = true
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

extension EditAccountViewController {
    // MARK: - Public Methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == passwordTF && !editSwitch.isOn {
            return false;
        }
        return true
    }
}
