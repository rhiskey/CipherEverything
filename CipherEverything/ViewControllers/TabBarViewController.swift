//
//  TabBarViewController.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import UIKit

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
        let accounts = DataManager.shared.passwords
        //let teamMembers = DataManager.shared.teamMembers
        
        let passwordsVC = viewControllers?.first as! PasswordsTableViewController
        //let teamVC = viewControllers?.last as! TeamTableViewController
        
        passwordsVC.passwords = accounts
        //teamVC.teamMembers = teamMembers
    }
}

