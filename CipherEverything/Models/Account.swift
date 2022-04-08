//
//  Password.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 03.04.2022.
//

import Foundation

struct Account {
    
    let website: String
    var password: String
    
    static func getAccounts() -> [Account] {
        [
            Account(website: "VK", password: "abc123"),
            Account(website: "YouTube", password: "Qwerty"),
            Account(website: "GitHub", password: "1234"),
            Account(website: "SwiftBook", password: "12345678")
        ]
    }

}
