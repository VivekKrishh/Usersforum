//
//  UserTableCell.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import UIKit

class UserListTableCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCity: UILabel!
    
    @IBOutlet weak var labelPhoneNumber: UILabel!
    
    static var name: String {
        return String(describing: self)
    }
}
