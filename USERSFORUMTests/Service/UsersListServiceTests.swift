//
//  UsersListServiceTests.swift
//  USERSFORUMTests
//
//  Created by Vivek on 16/10/23.
//

import XCTest
@testable import USERSFORUM

final class UsersListServiceTests: XCTestCase {

    let systemUnderTest: UsersListServiceProtocol = MockUsersListService()
    
    func testGetUsersListAPI_forSuccessCase_returnsData() {
        
        let expectations = XCTestExpectation(description: "testUsersListSuccess")
        
        systemUnderTest.getUsersInfoFromAPI { usersListData, error in
            XCTAssertNotNil(usersListData)
            XCTAssertNil(error)
            expectations.fulfill()
        }
        
        wait(for: [expectations], timeout: 10.0)
    }
    
    func testGetUsersListAPI_forFailureCase_returnsNilData() {
        
        let expectations = XCTestExpectation(description: "testUsersListFailure")
        
        (systemUnderTest as? MockUsersListService)?.responseState = .failure
        
        systemUnderTest.getUsersInfoFromAPI { usersListData, error in
            XCTAssertNil(usersListData)
            XCTAssertNotNil(error)
            expectations.fulfill()
        }
        
        wait(for: [expectations], timeout: 10.0)
    }

}
