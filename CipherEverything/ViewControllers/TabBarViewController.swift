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
        guard let tabBarChildViewControllers = viewControllers else { return }
        
        for viewController in tabBarChildViewControllers {
            guard let navigationVC = viewController as? UINavigationController else { return }
            
            if let accountsVC = navigationVC.topViewController as? AccountsTableViewController {
                accountsVC.accounts = accounts
            } else if let teamVC = navigationVC.topViewController as? TeamTableViewController {
                teamVC.developersList = teamMembers
            }
        }
    }
}

