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
    
    private init() {}
}
