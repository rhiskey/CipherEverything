//
//  TeamDataManager.swift
//  CipherEverything
//
//  Created by Евгений Волошенко on 07.04.2022.
//

import Foundation

class TeamDataManager {
    
    static let shared = TeamDataManager()
    
    let teamMembers = TeamMember.getTeamMember()
    
    private init() {}
}
