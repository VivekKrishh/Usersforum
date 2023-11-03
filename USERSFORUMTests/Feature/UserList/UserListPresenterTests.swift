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
        presenter.fetchUserListDataForView()
        
        // then
        let expectation =  expectation(description: "\(#function)-testUserListPresenter")
        // Wait for mock response and check result
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(view.shouldShowResult)
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
        presenter.fetchUserListDataForView()
        // then
        let expectation =  expectation(description: "\(#function)-testUserListPresenterWithError")
        // Wait for mock response and check result
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertFalse(view.shouldShowResult)
        }
        wait(for: [expectation], timeout: 0.2)
    }
    
    func testNavigateToDetail() {
        let presenter = MockUserListPresenter()
        let mockUserInfo = UserInfo(id: 1, name: "John", username: "Wick", email: "john@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net"))
        XCTAssertFalse(presenter.shouldNavigateToDetail)
        presenter.navigateToDetail(with: mockUserInfo)
        XCTAssertTrue(presenter.shouldNavigateToDetail)
    }
    
}
