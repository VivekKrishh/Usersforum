//
//  MockUserListPresenter.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import Foundation

enum ToCheck {
    case success
    case failure
}

final class MockUserListPresenter: UserListPresenterProtocol {
    var shouldNavigateToDetail: Bool = false
    
    func getDatasByIndex(index: Int) -> UserInfo? {
      return nil
    }
    
    func getUsersData() -> [UserInfo] {
      return []
    }
    
    func getUsersCount() -> Int {
      return 10
    }
    
    var view: USERSFORUM.UserListViewProtocol?
    var router: USERSFORUM.UserListRouterProtocol?
    var interactor: USERSFORUM.UserListInteractorProtocol?
    var toTest: ToCheck? = .success
    
    func fetchUserListDataForView() {
        if toTest == .success {
            view?.showUsersList(with: [], error: nil)
        } else {
            view?.showUsersList(with: nil, error: .unexpectedStatusCode)
        }
    }
    
    func navigateToDetail(with userData: USERSFORUM.UserInfo) {
        shouldNavigateToDetail = true
    }
}
