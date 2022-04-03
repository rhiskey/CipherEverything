//
//  TabBarViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import UIKit

// MARK: - Mock Data
struct Password {
    let site: String
    let login: String
    let password: String
}


class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Accounts"
        setupViewControllers()
    }
}

// MARK: - Private Methods
extension TabBarViewController {
    private func setupViewControllers() {
        let accounts = Password.getPasswordList()
        let passwordsVC = viewControllers?.first as! PasswordsTableViewController
//        let teamVC = viewControllers?.last as! TeamTableViewController
        
        passwordsVC.passwords = accounts
//        teamVC.teamMembers = members
    }
}

// MARK: - Mock
extension Password {
    static func getPasswordList() -> [Password] {
        var passwords: [Password] = []
        
        passwords.append(Password(
            site: "VK.com",
            login: "+79121221214",
            password: "qwerty123456"
        ))
        
        passwords.append(Password(
            site: "Telegram",
            login: "+932423432143",
            password: "123456"
        ))
        
        passwords.append(Password(
            site: "WhatsApp",
            login: "+783723842380",
            password: "Poiorweow12EA1!"
        ))
        
        passwords.append(Password(
            site: "Instagram",
            login: "+32141341313",
            password: "ASdjo32o!f0!"
        ))
        
        passwords.append(Password(
            site: "Facebook",
            login: "+312493124i09",
            password: "0u0U)FJEIAijls"
        ))
        
        passwords.append(Password(
            site: "Discord",
            login: "user#3333",
            password: "passs"
        ))
        
        passwords.append(Password(
            site: "GitHub",
            login: "@gituser",
            password: "strongestpass"
        ))
        
        return passwords
    }
}
