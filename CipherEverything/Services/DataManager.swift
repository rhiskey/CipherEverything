//
//  DataManager.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var accounts = Account.getAccounts()
    let teamMembers = TeamMember.getTeamMember()
    
    func addNew(account: Account) {
        accounts.append(account)
    }
    
    func updateAccount(for account: Account) {
        var newAccounts: [Account] = []
        
        for var acc in accounts {
            if acc.website == account.website {
                acc.password = account.password
            
            }
            newAccounts.append(acc)
        }
        accounts = newAccounts
    }
    
    private init() {}
}
