//
//  UserListInteractorTest.swift
//  USERSFORUMTests
//
//  Created by Vivek on 21/10/23.
//

import XCTest
@testable import USERSFORUM

final class UserListInteractorTest: XCTestCase {
    func testUserListInteractor() {
        // given
        let mockUserListDataService: MockUsersListDataService = MockUsersListDataService()
        
        mockUserListDataService.fetchUserList { usersData, error in
            if usersData != nil {
                XCTAssertNotNil(usersData)
                XCTAssertNil(error)
            }
        }
        
    }

}
