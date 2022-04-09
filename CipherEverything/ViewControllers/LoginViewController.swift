//
//  LoginViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    
    private let usersData = Users.usersData
    private let dataManager = DataManager.shared
    // TODO: Think about it, what is the best approach? Maybe get from DataManager?
    private var person: Person?
    
    private let sharedUsers = Users.usersData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.title = "Exit"
        
        usernameTF.delegate = self
        passwordTF.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(usersData.usersList.count)
    }
    
    @IBAction func logInPressed() {
        if let userID = sharedUsers.usersList[usernameTF.text ?? ""] {
            if sharedUsers.users[userID].password == passwordTF.text {
                person = sharedUsers.users[userID]
                return
            }
        }
        showAlertForLogin(with: "Wrong pass or login", and: "Try again")
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(with: "I will tell you", and: "Password")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let navigationVC = $0 as? UINavigationController {
                if let accountsVC = navigationVC.topViewController as? AccountsTableViewController {
                    accountsVC.person = person
                } else if let teamVC = navigationVC.topViewController as? TeamTableViewController {
                    teamVC.dataManager = dataManager
                }
            }
        }
    }
}

//MARK: - Alerts
extension LoginViewController {
    
    private func showAlert(with title: String, and text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        present(alert, animated: true)
        
        let alertAction = UIAlertAction(title: "Close", style: .default)
        alert.addAction(alertAction)
    }
    
    private func showAlertForLogin(with title: String, and text: String) {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        present(alert, animated: true)
        
        let alertAction = UIAlertAction(title: "Try", style: .default) { _ in
            self.passwordTF.text = nil
        }
        alert.addAction(alertAction)
    }
}

//MARK: Unwind segue
extension LoginViewController {
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if usernameTF.isFirstResponder {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
        }
        return true
    }
}
