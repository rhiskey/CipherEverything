//
//  DataManager.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let accounts = Account.getAccounts()
    let teamMembers = TeamMember.getTeamMember()
    
    private init() {}
}
