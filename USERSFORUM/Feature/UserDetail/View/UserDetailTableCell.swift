//
//  UserDetailTableCell.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import UIKit

class UserDetailTableCell: UITableViewCell {
    @IBOutlet private weak var labelPlaceholder: UILabel!
    @IBOutlet private weak var labelValue: UILabel!
    
    func configureCell(with placeholderData: DataForDisplay, model: UserInfo) {
        labelPlaceholder.text = placeholderData.rawValue.capitalized
        
        switch placeholderData {
        case .name:
            labelValue.text = model.name
        case .username:
            labelValue.text = model.username
        case .email:
            labelValue.text = model.email
        case .address:
            labelValue.text = model.address.street
        case .phone:
            labelValue.text = model.phone
        case .website:
            labelValue.text = model.website
        }
    }
}
