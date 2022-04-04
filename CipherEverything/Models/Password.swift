//
//  Password.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import Foundation

struct Password {
    
    let website: String
    let password: String
    
    static func getPasswords() -> [Password] {
        
        var passwords: [Password] = []
        
        passwords.append(Password(website: "VK", password: "abc123"))
        passwords.append(Password(website: "YouTube", password: "Qwerty"))
        passwords.append(Password(website: "GitHub", password: "1234"))
        passwords.append(Password(website: "SwiftBook", password: "12345678"))
        
        return passwords
    }
}
