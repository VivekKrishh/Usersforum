//
//  UsersListPresenterTests.swift
//  USERSFORUMTests
//
//  Created by Vivek on 19/10/23.
//

import XCTest
@testable import USERSFORUM

final class UserListPresenterTests: XCTestCase {
    
    func testUserListPresenter() {
        // given
        let view = MockUserListView()
        let router = UserListRouter()
        let presenter = MockUserListPresenter()
        
        view.presenter = presenter
        view.router = router
        
        presenter.view = view
        presenter.router = router
        // when
        presenter.updateView()
        
        // then
        let expectation =  expectation(description: "\(#function)-testUserListPresenter")
        // Wait for mock response and check result
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            print("Show UI updated:\(view.showUIUpdated)")
            XCTAssertTrue(view.showUIUpdated)
        }
        wait(for: [expectation], timeout: 0.2)
    }
    
    func testUserListPresenterWithError() {
        // given
        let view = MockUserListView()
        let router = UserListRouter()
        let presenter = MockUserListPresenter()
        
        view.presenter = presenter
        view.router = router
        
        presenter.view = view
        presenter.router = router
        
        // when
        presenter.toTest = .failure
        presenter.updateView()
        
        // then
        let expectation =  expectation(description: "\(#function)-testUserListPresenterWithError")
        // Wait for mock response and check result
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertFalse(view.showUIUpdated)
        }
        wait(for: [expectation], timeout: 0.2)
    }
    
}
