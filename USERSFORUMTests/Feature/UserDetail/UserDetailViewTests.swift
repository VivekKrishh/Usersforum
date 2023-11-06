//
//  UserDetailViewTests.swift
//  USERSFORUMTests
//
//  Created by Vivek on 03/11/23.


import XCTest
@testable import USERSFORUM

class UserDetailViewTests: XCTestCase {
    var viewControllerUnderTest: UserDetailView!
    
    override func setUp() {
        super.setUp()
        
        self.viewControllerUnderTest = UIStoryboard.instantiate(identifier: StoryboardIdentifier.userDetail)
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.viewControllerUnderTest = nil
    }
    
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.userDetailTable)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.userDetailTable.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.userDetailTable.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.userDetailTable, cellForRowAt: IndexPath(row: 0, section: 0)) as? UserDetailTableCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = String(describing: UserDetailTableCell.self)
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
}
