//
//  UserDetailPresenter.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation

protocol UserDetailPresenterProtocol {
    var view: UserDetailViewProtocol? { get set }
    var router: UserDetailRouterProtocol? { get set }
    var interactor: UserDetailInteractorProtocol? { get set }
}

final class UserDetailPresenter: UserDetailPresenterProtocol {
    var view: UserDetailViewProtocol?
    var router: UserDetailRouterProtocol?
    var interactor: UserDetailInteractorProtocol?
    
    func navigateBack() {
        self.router?.navigateBack()
    }
}
