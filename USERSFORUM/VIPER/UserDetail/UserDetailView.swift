//
//  UserDetailView.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation
import UIKit

protocol UserDetailViewProtocol {
    
    func displayUserInfo(from model: UserInfo)
    
    func navigateBack()
    
}

class  UserDetailView: UIViewController, UserDetailViewProtocol {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static var name: String {
        return String(describing: self)
    }
    
    func displayUserInfo(from model: UserInfo) {
        print("Model : \(model.description)")
    }
    
    func navigateBack() {

    }
    
    
}
