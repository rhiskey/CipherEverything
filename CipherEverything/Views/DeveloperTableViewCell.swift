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
        self.developerImage.layer.masksToBounds = true
        self.developerImage.layer.borderWidth = 0.5
        self.developerImage.contentMode = .scaleToFill
    }
    
}
