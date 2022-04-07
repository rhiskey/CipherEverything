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
    
    func addNew(account: Account) {
        accounts.append(account)
    }
    
    func update(of account: Account) {
        var newAccounts: [Account] = []

        for var acc in accounts {
            if acc.website == account.website {
                acc.password = account.password
            }
            newAccounts.append(acc)
        }
        accounts = newAccounts
    }
    
    func delete(of account: Account) {
        accounts = accounts.filter { $0.website != account.website }
    }
    
    private init() {}
}
