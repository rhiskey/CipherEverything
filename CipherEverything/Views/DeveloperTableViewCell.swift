//
//  DevelopereTableViewCell.swift
//  CipherEverything
//
//  Created by u on 05.04.2022.
//

import UIKit

class DeveloperTableViewCell: UITableViewCell {
    
    @IBOutlet var developerName: UILabel!
    @IBOutlet var developerSurname: UILabel!
    @IBOutlet var developerProff: UILabel!
    
    @IBOutlet var developerImage: UIImageView!
    
    func forceChanges(teamMember: TeamMember) {
        
        let size = CGSize(width: 84, height: 84)
        let image = teamMember.photo
        let resizedImage = image?.preparingThumbnail(of: size)
        
        self.developerName.text = teamMember.name
        self.developerSurname.text = teamMember.surname
        self.developerProff.text = teamMember.description
        
        self.developerImage.image = resizedImage
        self.developerImage.layer.cornerRadius = self.developerImage.frame.height / 2
        
        let borderColor = UIColor(red:0, green:0, blue:0, alpha:1.0)
        self.developerImage.layer.borderColor = borderColor.cgColor
        self.developerImage.layer.borderWidth = 3.0
        
        self.developerImage.contentMode = .scaleAspectFill
        
    }
    
}


