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
    // I need your image to next step
    let photo: UIImage? = UIImage(systemName: "phone")
    
    var fullname: String {
        "\(surname) \(name)"
    }
    
    static func getTeamMember() -> [TeamMember] {
        
        var teamMembers: [TeamMember] = []
        
        teamMembers.append(TeamMember(name: "Evgeniy",
                                      surname: "Voloshenko",
                                      description: "IOS Developer"))
        
        teamMembers.append(TeamMember(name: "Vladimir",
                                      surname: "Kiselev",
                                      description: "IOS Developer",
                                      photo: "Vladimir"))
        
        teamMembers.append(TeamMember(name: "Sergey",
                                      surname: "Заполни сам",
                                      description: "Заполни сам"))
        
        return teamMembers
    }
}
