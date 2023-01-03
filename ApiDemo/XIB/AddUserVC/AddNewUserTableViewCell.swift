//
//  AddNewUserTableViewCell.swift
//  ApiDemo
//
//  Created by Mac Mini on 03/01/23.
//

import UIKit

class AddNewUserTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var userActivityImageView: UIImageView!
    //MARK: - Declaration
    static let identifier = "AddNewUserTableViewCell"
    
    
    //MARK: - View life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    
    //MARK: - Setupview function
    
    
}
