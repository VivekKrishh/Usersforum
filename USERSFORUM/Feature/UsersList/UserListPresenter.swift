//
//  Presenter.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//
import Foundation

protocol UserListPresenterProtocol {
    var view: UserListViewProtocol? { get set }
    var router: UserListRouterProtocol? { get set }
    var interactor: UserListInteractorProtocol? { get set }
    
    // Tell interactor to call the API to update the View
    func updateView()
    // View User Interaction Methods
    func navigateToDetail(with userData: UserInfo)
}

final class UserListPresenter: UserListPresenterProtocol {
    var view: UserListViewProtocol?
    var router: UserListRouterProtocol?
    var interactor: UserListInteractorProtocol?
    
    init(view: UserListViewProtocol? = nil, router: UserListRouterProtocol? = nil, interactor: UserListInteractorProtocol? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func updateView() {
        self.interactor?.getUserList(onCompletion: { data, error in
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
