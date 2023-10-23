//
//  MockUserListView.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import Foundation

final class MockUserListView: UserListViewProtocol {
    var showUIUpdated: Bool = false
    var presenter: UserListPresenterProtocol?
    var router: UserListRouterProtocol?
    
    func updateUI(with usersData: [USERSFORUM.UserInfo]?, error: USERSFORUM.ResponseError?) {
        if error == nil {
            showUIUpdated = true
        } else {
            showUIUpdated = false
        }
    }
}
