//
//  Password.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import Foundation

struct Account {
    
    let website: String
    let password: String
    
    static func getAccounts() -> [Account] {
        
        var accounts: [Account] = []
        
        accounts.append(Account(website: "VK", password: "abc123"))
        accounts.append(Account(website: "YouTube", password: "Qwerty"))
        accounts.append(Account(website: "GitHub", password: "1234"))
        accounts.append(Account(website: "SwiftBook", password: "12345678"))
        
        return accounts
    }
}
