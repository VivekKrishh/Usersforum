//
//  MockUserDetailRouter.swift
//  USERSFORUMTests
//
//  Created by Pearlarc on 03/11/23.
//

import Foundation

final class MockUserDetailRouter: UserDetailRouterProtocol {
    var shouldNavigateBack: Bool = false
    func navigateBack() {
        shouldNavigateBack = true
    }
}
