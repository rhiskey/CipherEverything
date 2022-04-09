//
//  UsersData.swift
//  CipherEverything
//
//  Created by u on 09.04.2022.
//

import Foundation

class Users {
    static let usersData = Users()
    
    var countOfUsersID = 1
    
    var users: [Person] = [Person(name: "Username", password: "Password", accounts: Account.getAccounts(), usersID: 0)]
    
    var usersList: [String : Int] = ["Username": 0]
    
    
    private init() {}
}
