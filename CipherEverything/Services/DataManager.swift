//
//  DataManager.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let passwords = Password.getPasswords()
    let teamMembers = TeamMember.getTeamMember()
    
    private init() {}
}
