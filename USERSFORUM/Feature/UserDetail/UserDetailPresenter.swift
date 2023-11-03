//
//  UserDetailPresenter.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation

protocol UserDetailPresenterProtocol {
    var view: UserDetailViewProtocol? { get set }
}

final class UserDetailPresenter: UserDetailPresenterProtocol {
    var view: UserDetailViewProtocol?
    private var router: UserDetailRouterProtocol?
    private var interactor: UserDetailInteractorProtocol?
    
    func navigateBack() {
        self.router?.navigateBack()
    }
}
