//
//  Presenter.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//
import Foundation

protocol UserListPresenterProtocol {    
    // Tell interactor to call the API to update the View
    func fetchUserListDataForView()
    // View User Interaction Methods
    func navigateToDetail(with userData: UserInfo)
}

final class UserListPresenter: UserListPresenterProtocol {
    var view: UserListViewProtocol?
    private var router: UserListRouterProtocol
    private var interactor: UserListInteractorProtocol
    private var users: [UserInfo] = []
    
    init(router: UserListRouterProtocol, interactor: UserListInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    func fetchUserListDataForView() {
        self.interactor.fetchUserList(onCompletion: { [self] data, error in
            if data != nil {
                self.view?.showUsersList(with: data, error: nil)
                if let data = data {
                    self.users = data
                }else {
                    self.users = []
                }
                
            } else {
                self.view?.showUsersList(with: nil, error: error)
            }
        })
    }
    
    func navigateToDetail(with userData: UserInfo) {
        self.router.navigateToDetail(with: userData)
    }
    
}

extension UserListPresenter {
    // View Model Methods
    func getDatasByIndex(index:Int) -> UserInfo? {
        guard let user = users.item(at: index) else { return nil }
        return user
    }
    
    func getUsersData() -> [UserInfo] {
        return users
    }
    
    func getUsersCount() -> Int {
        return users.count
    }
}
