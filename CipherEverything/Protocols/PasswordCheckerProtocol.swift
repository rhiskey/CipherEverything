//
//  PasswordCheckerProtocol.swift
//  CipherEverything
//
//  Created by Владимир Киселев on 07.04.2022.
//

protocol PasswordCheckerProtocol {
    func passwordRegularExpressionCheck(for text: String)
    func isValidPassword(_ password: String) -> Bool
}
