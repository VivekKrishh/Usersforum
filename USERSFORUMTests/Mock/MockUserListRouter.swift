//
//  MockUserListRouter.swift
//  USERSFORUMTests
//
//  Created by Vivek on 07/11/23.
//

import Foundation

final class MockUserListRouter: UserListRouterProtocol {
    var shouldNavigateToUserDetail: Bool = false
    
    func navigateToUserDetail(with userData: UserInfo) {
        shouldNavigateToUserDetail = true
    }
}
