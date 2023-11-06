//
//  UserDetailPresenter.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation

protocol UserDetailPresenterProtocol {
    func fetchUserDetailDataForView()
}

final class UserDetailPresenter: UserDetailPresenterProtocol {
    var view: UserDetailViewProtocol?
    private var router: UserDetailRouterProtocol?
    private var interactor: UserDetailInteractorProtocol?
    
    init(router: UserDetailRouterProtocol, interactor: UserDetailInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func fetchUserDetailDataForView() {
        self.interactor?.fetchUserDetail(onCompletion: { data, error in
            if data != nil {
                // Call method in view class with the data to refresh the UI
            }
        })
    }
    
    func navigateBack() {
        self.router?.navigateBack()
    }
}
