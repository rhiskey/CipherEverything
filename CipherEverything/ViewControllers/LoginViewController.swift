//
//  LoginViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var passwordTF: UITextField!
    
    let passwordForLogin = ""
    
    var accounts: [Account]?
    var teamMembers: [TeamMember]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accounts = DataManager.shared.accounts
        teamMembers = DataManager.shared.teamMembers
        
        navigationItem.leftBarButtonItem?.title = "Exit"
    }
    
    
    @IBAction func logInPressed() {
        if passwordTF.text != passwordForLogin {
            showAlertForLogin(with: "Wrong password", and: "Try again")
        }
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(with: "I will tell you", and: passwordForLogin)
    }
    
    @IBAction func logOut(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        passwordTF.text = nil
    }
}

//MARK: - Private Functions (alerts)
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


