//
//  APIEndPointTests.swift
//  USERSFORUMTests
//
//  Created by Vivek on 15/10/23.
//

import XCTest
@testable import USERSFORUM
final class APIEndPointTests: XCTestCase {

    func testApiEndPoints() {
        XCTAssertEqual(APIEndPoint.fetchUsers.path, "https://jsonplaceholder.typicode.com/users")
    }
    
}
