//
//  MVPTableViewCell.swift
//  MVP_three
//
//  Created by AnatoliiOstapenko on 20.03.2022.
//

import UIKit

class MVPTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func getListOfText(data: UserModel) {
        usernameLabel.text = data.username
        fullNameLabel.text = data.name
        emailLabel.text = data.email
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        
    }
    
}
