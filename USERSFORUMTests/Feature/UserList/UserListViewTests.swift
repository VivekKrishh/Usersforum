//
//  UserListViewTests.swift
//  USERSFORUMTests
//
//  Created by Vivek on 03/11/23.
//

import XCTest

@testable import USERSFORUM
class UserListViewTests: XCTestCase {
    var viewControllerUnderTest: UserListView!
    
    override func setUp() {
        super.setUp()
        
        self.viewControllerUnderTest = UIStoryboard.instantiate(identifier: StoryboardIdentifier.usersList)
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.viewControllerUnderTest = nil
    }
    
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.usersTable)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.usersTable.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.usersTable.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }
}
