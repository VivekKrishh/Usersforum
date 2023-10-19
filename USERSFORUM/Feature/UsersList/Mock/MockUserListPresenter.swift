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

class MockUserListPresenter: UserListPresenterProtocol {
    var view: USERSFORUM.UserListViewProtocol?
    var router: USERSFORUM.UserListRouterProtocol?
    var interactor: USERSFORUM.UserListInteractorProtocol?
    var toTest: ToCheck? = .success
    
    func updateView() {
        if toTest == .success {
            view?.updateUI(with: [], error: nil)
        } else {
            view?.updateUI(with: nil, error: .unexpectedStatusCode)
        }
    }
    
    func navigateToDetail(with userData: USERSFORUM.UserInfo) { }
}
