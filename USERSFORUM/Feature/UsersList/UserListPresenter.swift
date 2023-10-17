//
//  Presenter.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

protocol UserListPresenterProtocol {
    
    var view: UserListView? { get set }
    
    var router: UserListRouter? { get set }
    
    var interactor: UserListInteractor? { get set }
    
    // Tell interactor to call the API to update the View
    func updateView()
    
}

protocol ViewUserInteractionProtocol {
    
    func navigateToDetail(with userData: UserInfo)
}


class UserListPresenter: UserListPresenterProtocol, ViewUserInteractionProtocol {

    var view: UserListView?
    
    var router: UserListRouter?
    
    var interactor: UserListInteractor?
    
    func updateView() {
        
        self.interactor?.getUsersInfoFromService(onCompletion: { data, error in
            if data != nil {
                self.view?.updateUI(with: data, error: nil)
            } else {
                self.view?.updateUI(with: nil, error: error)
            }
        })
    }
    
    func navigateToDetail(with userData: UserInfo) {
        self.router?.navigateToDetail(with: userData)
    }
    
}
