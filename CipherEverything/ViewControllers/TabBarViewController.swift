//
//  TabBarViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var accounts: [Account]!
    var teamMembers: [TeamMember]!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Accounts"
        navigationItem.hidesBackButton = true
        setupViewControllers()
    }
}

// MARK: - Private Methods
extension TabBarViewController {
    private func setupViewControllers() {
        let passwordsVC = viewControllers?.first as! PasswordsTableViewController
        let teamVC = viewControllers?.last as! TeamTableViewController
        
        passwordsVC.accounts = accounts
        teamVC.developersList = teamMembers
    }
}

