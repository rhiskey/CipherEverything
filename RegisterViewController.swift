//
//  RegisterViewController.swift
//  CipherEverything
//
//  Created by u on 09.04.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var sharedUsersData = Users.usersData
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerPressed() {
        sharedUsersData.usersList[userNameTF.text ?? ""] = sharedUsersData.countOfUsersID
        
        let newPersonForArray = Person(name: userNameTF.text ?? "", password: passwordTF.text ?? "", accounts: [], usersID: sharedUsersData.countOfUsersID)
        
        sharedUsersData.users.append(newPersonForArray)
        
        sharedUsersData.countOfUsersID += 1
        
        print(sharedUsersData.usersList)
        
        dismiss(animated: true, completion: nil)
    }
    

}
