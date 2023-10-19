//
//  UserTableCell.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import UIKit

class UserListTableCell: UITableViewCell {
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelCity: UILabel!
    @IBOutlet private weak var labelPhoneNumber: UILabel!
    
    private static var name: String {
        return String(describing: self)
    }
    
    func configureCell(with model: UserInfo) {
        labelName.text = model.name
        labelCity.text = model.address.city
        labelPhoneNumber.text = model.phone
    }
}
