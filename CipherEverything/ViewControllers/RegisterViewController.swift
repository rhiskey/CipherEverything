//
//  RegisterViewController.swift
//  CipherEverything
//
//  Created by u on 09.04.2022.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, PasswordCheckerProtocol {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var checkPassLabel: UILabel!
    
    
    var sharedUsersData = Users.usersData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        checkPassLabel.isHidden = true
        
    }
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        checkPassLabel.isHidden = false
        passwordRegularExpressionCheck(for: text)
    }
    
    @IBAction func registerPressed() {
        
        if !isValidPassword(passwordTF.text ?? "") {
            registerAlert(with: "Whoopsie", message: "You need stronger password")
            return
        }
        
        sharedUsersData.usersList[userNameTF.text ?? ""] = sharedUsersData.countOfUsersID
        
        let newPersonForArray = Person(name: userNameTF.text ?? "", password: passwordTF.text ?? "", accounts: [], usersID: sharedUsersData.countOfUsersID)
        
        sharedUsersData.users.append(newPersonForArray)
        
        sharedUsersData.countOfUsersID += 1
        
        registerAlert(with: "You are successfully registered", message: "Thank you")
    }
}


extension RegisterViewController {
    
    private func registerAlert(with text: String, message: String) {
        let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = nil
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
}

extension RegisterViewController {
    func passwordRegularExpressionCheck(for text: String) {
        if (isValidPassword(text)) {
            checkPassLabel.text = "Strong password!"
            checkPassLabel.textColor = .systemGreen
        } else {
            checkPassLabel.text = "Weak password!"
            checkPassLabel.textColor = .systemRed
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

extension RegisterViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
        if passwordTF.text == nil || passwordTF.text == "" {
            checkPassLabel.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if userNameTF.isFirstResponder {
            passwordTF.becomeFirstResponder()
        } else {
            registerPressed()
        }
        return true
    }
}
