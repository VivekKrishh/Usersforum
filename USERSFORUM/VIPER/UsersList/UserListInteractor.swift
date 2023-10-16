//
//  Interactor.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

protocol UserListInteractorProtocol {
    
    var presenter: UserListPresenter? { get set }
    
    var usersListDataService: UsersListServiceProtocol? { get set }
    
    func getUsersInfoFromService(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void)
}

class UserListInteractor: UserListInteractorProtocol {
    
    var presenter: UserListPresenter?
    
    var usersListDataService: UsersListServiceProtocol?
    
    init(presenter: UserListPresenter? = nil, usersListDataService: UsersListServiceProtocol? = UsersListService()) {
        self.presenter = presenter
        self.usersListDataService = usersListDataService
    }
    
    func getUsersInfoFromService(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void)  {
        
        self.usersListDataService?.getUsersInfoFromAPI { data, error in
            if let data = data {
                onCompletion(data, nil)
            } else {
                onCompletion(nil, error)
            }
        }
    }
    
}

