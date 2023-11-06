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
        // Given
        let mockUserListDataService: MockUsersListDataService = MockUsersListDataService()
        // System under test
        let interactor = UserListInteractor(usersListDataService: mockUserListDataService)
        
        interactor.fetchUserList { usersData, error in
            if usersData != nil {
                XCTAssertNotNil(usersData)
                XCTAssertNil(error)
            }
        }
    }
}
