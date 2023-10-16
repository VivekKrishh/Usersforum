//
//  APIEndPointTests.swift
//  USERSFORUMTests
//
//  Created by Pearlarc on 15/10/23.
//

import XCTest
@testable import USERSFORUM
final class APIEndPointTests: XCTestCase {

    func testApiEndPoints() {
        XCTAssertEqual(APIEndPoint.FetchUsers.path, "https://jsonplaceholder.typicode.com/users")
    }
    
}