//
//  UserInfoDataTests.swift
//  USERSFORUMTests
//
//  Created by Vivek on 17/10/23.
//

import XCTest
@testable import USERSFORUM

final class UserInfoDataTests: XCTestCase {
    func testUserInfoParsing() throws {
        if let userListData = try getUserListDataObject(), let userInfo = userListData.first {
            // then
            XCTAssertEqual(userInfo.name, "Leanne Graham")
            XCTAssertEqual(userInfo.id, 1)
            XCTAssertEqual(userInfo.username, "Bret")
            XCTAssertEqual(userInfo.email, "Sincere@april.biz")
        } else {
            XCTFail("UserListResponse to UserInfo parsing failed")
        }
    }
    
    private func getUserListDataObject() throws -> [UserInfo]? {
        let data = try TestUtils.data(forResource: "UsersListResponse")
        let cityWeatherData = try? JSONDecoder().decode([UserInfo].self, from: data)
        return cityWeatherData ?? nil
    }
}
