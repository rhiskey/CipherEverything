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
    let photo: UIImage?
    
    var fullname: String {
        "\(surname) \(name)"
    }
    
    static func getTeamMember() -> [TeamMember] {
        [
            TeamMember(name: "Evgeniy",
                       surname: "Voloshenko",
                       description: "IOS Developer",
                       photo: UIImage(named: "Evgeniy")),
            
            TeamMember(name: "Vladimir",
                       surname: "Kiselev",
                       description: "Team Lead",
                       photo: UIImage(named: "Vladimir")),
            
            TeamMember(name: "Sergey",
                       surname: "Veretennikov",
                       description: "IOS Developer",
                       photo: UIImage(named: "Sergey"))
        ]
    }
}
