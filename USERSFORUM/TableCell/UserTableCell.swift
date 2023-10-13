//
//  UserTableCell.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import UIKit

class UserTableCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCity: UILabel!
    
    @IBOutlet weak var labelPhoneNumber: UILabel!
    
    static var name: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
