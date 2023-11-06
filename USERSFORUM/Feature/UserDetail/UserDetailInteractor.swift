//
//  UserDetailInteractor.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation

protocol UserDetailInteractorProtocol {
    var presenter: UserDetailPresenter? { get set }
    func fetchUserDetail(onCompletion: @escaping (_ data: UserInfo?, _ error: ResponseError?) -> Void)
}

final class UserDetailInteractor: UserDetailInteractorProtocol {
    var presenter: UserDetailPresenter?
    private var userDetailDataService: UserDetailDataServiceProtocol
    
    init(userDetailDataService: UserDetailDataServiceProtocol = UserDetailDataService()) {
        self.userDetailDataService = userDetailDataService
    }
    // Don't have api for "user details" so created this method for demonstration purposes
    func fetchUserDetail(onCompletion: @escaping (_ data: UserInfo?, _ error: ResponseError?) -> Void)  {
        self.userDetailDataService.fetchUserDetails { data, error in
            if let data = data {
                onCompletion(data, nil)
            } else {
                onCompletion(nil, error)
            }
        }
    }    
}
