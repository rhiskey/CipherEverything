//
//  Person.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 08.04.2022.
//

import Foundation

struct Person {
    let name: String
    let password: String
    var accounts: [Account]
    let usersID: Int
    
    static func getPerson() -> Person {
        Person(name: "User", password: "Password", accounts: Account.getAccounts(), usersID: 0)
    }
}
