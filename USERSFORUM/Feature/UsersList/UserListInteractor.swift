//
//  Interactor.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

protocol UserListInteractorProtocol {
    var presenter: UserListPresenterProtocol? { get set }
    var userListDataService: UserListDataServiceProtocol? { get set }
    
    func getUserList(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void)
}

final class UserListInteractor: UserListInteractorProtocol {
    var presenter: UserListPresenterProtocol?
    var userListDataService: UserListDataServiceProtocol?
    
    init(presenter: UserListPresenter? = nil, usersListDataService: UserListDataServiceProtocol? = UserListDataService()) {
        self.presenter = presenter
        self.userListDataService = usersListDataService
    }
    
    func getUserList(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void)  {
        self.userListDataService?.getUserList { data, error in
            if let data = data {
                onCompletion(data, nil)
            } else {
                onCompletion(nil, error)
            }
        }
    }    
}
