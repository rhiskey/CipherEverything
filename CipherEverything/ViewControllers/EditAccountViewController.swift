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
    var account: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTF.delegate = self
        
        title = account?.website
        passwordTF.text = account?.password

        editSwitch.setOn(false, animated: false)
        
        passwordRegularExpressionCheck(for: account?.password ?? "")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        passwordTF.text = ""
        super.viewDidDisappear(animated)
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
    
}

// MARK: - Public UI Methods
extension EditAccountViewController {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == passwordTF && !editSwitch.isOn {
            return false;
        }
        return true
    }
}

// MARK: - Password Checker
extension EditAccountViewController {
    func passwordRegularExpressionCheck(for text: String) {
        if (isValidPassword(text)) {
            checkPasswordLB.text = "Strong password!"
            checkPasswordLB.textColor = .systemGreen
        } else {
            checkPasswordLB.text = "Weak password!"
            checkPasswordLB.textColor = .systemRed
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
extension EditAccountViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
        return true

    }
}
