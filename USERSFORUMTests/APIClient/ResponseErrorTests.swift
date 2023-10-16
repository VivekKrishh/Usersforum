//
//  ResponseErrorTests.swift
//  USERSFORUMTests
//
//  Created by Pearlarc on 15/10/23.
//

import XCTest
@testable import USERSFORUM

final class ResponseErrorTests: XCTestCase {

    func testResponseError() {
        XCTAssertEqual(ResponseError.invalidURL.description, "Endpoint is not valid.")
        XCTAssertEqual(ResponseError.decoding.description, "Users data not found.")
        XCTAssertEqual(ResponseError.unexpectedStatusCode.description, "Unknown error occured.\nPlease try again.")
    }

}
