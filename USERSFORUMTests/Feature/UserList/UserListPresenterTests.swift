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
        let mockUserListDataService = MockUsersListDataService()
        let presenter = UserListPresenter(router: router, interactor: UserListInteractor(usersListDataService: mockUserListDataService))
        
        view.presenter = presenter
        view.router = router
        
        presenter.view = view
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
    
    func testNavigateToDetail() {
        let mockUserListRouter = MockUserListRouter()
        let presenter = UserListPresenter(router: mockUserListRouter , interactor: UserListInteractor())
        let mockUserInfo = UserInfo(id: 2, name: "Ervin Howell", username: "Antonette", email: "Shanna@melissa.tv", address: Address(street: "Victor Plains", suite: "Suite 879", city: "Wisokyburgh", zipcode: "90566-7771", geo: Geo(lat: "-43.9509", lng: "-34.4618")), phone: "010-692-6593 x09125", website: "anastasia.net", company: Company(name: "Deckow-Crist", catchPhrase: "Proactive didactic contingency"))
        XCTAssertFalse(mockUserListRouter.shouldNavigateToUserDetail)
        presenter.navigateToDetail(with: mockUserInfo)
        XCTAssertTrue(mockUserListRouter.shouldNavigateToUserDetail)
    }
}
