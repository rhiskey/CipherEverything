//
//  User.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 02.04.2022.
//

import Foundation
import UIKit

struct TeamMember {
    
    let name: String
    let surname: String
    let description: String
    let photo: String
    
    var fullname: String {
        "\(surname) \(name)"
    }
    
    static func getTeamMember() -> [TeamMember] {
        
        var teamMembers: [TeamMember] = []
        
        teamMembers.append(TeamMember(name: "Evgeniy",
                                      surname: "Voloshenko",
                                      description: "IOS Developer",
                                      photo: "Eugeni"))
        
        teamMembers.append(TeamMember(name: "Vladimir",
                                      surname: "Заполни сам",
                                      description: "Заполни сам",
                                      photo: "Vladimir"))
        
        teamMembers.append(TeamMember(name: "Sergey",
                                      surname: "Veretennikov",
                                      description: "IOS Developer?",
                                      photo: "Sergey"))
        
        return teamMembers
    }
}
