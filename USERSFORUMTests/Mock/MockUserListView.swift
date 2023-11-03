//
//  MockUserListView.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import Foundation

final class MockUserListView: UserListViewProtocol {
    var shouldShowResult: Bool = false
    var presenter: UserListPresenterProtocol?
    var router: UserListRouterProtocol?
    
    func showUsersList(with usersData: [USERSFORUM.UserInfo]?, error: USERSFORUM.ResponseError?) {
        if error == nil {
            shouldShowResult = true
        } else {
            shouldShowResult = false
        }
    }
}
