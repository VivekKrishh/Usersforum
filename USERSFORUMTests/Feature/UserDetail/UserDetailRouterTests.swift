//
//  UserDetailRouterTests.swift
//  USERSFORUMTests
//
//  Created by Pearlarc on 03/11/23.
//

import XCTest
@testable import USERSFORUM

final class UserDetailRouterTests: XCTestCase {
    func testNavigateBack() {
       let router = MockUserDetailRouter()
        XCTAssertFalse(router.shouldNavigateBack)
       router.navigateBack()
        XCTAssertTrue(router.shouldNavigateBack)
    }
}
