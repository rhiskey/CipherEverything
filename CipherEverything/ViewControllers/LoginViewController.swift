//
//  LoginViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var passwordTF: UITextField!
    
    private let dataManager = DataManager.shared
    // TODO: Think about it, what is the best approach? Maybe get from DataManager?
    private let person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.title = "Exit"
    }
    
    @IBAction func logInPressed() {
        if passwordTF.text != person.password {
            showAlertForLogin(with: "Wrong password!", and: "Try again")
        }
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(with: "I will tell you", and: person.password)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let navigationVC = $0 as? UINavigationController {
                if let accountsVC = navigationVC.topViewController as? AccountsTableViewController {
                    accountsVC.dataManager = dataManager
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


