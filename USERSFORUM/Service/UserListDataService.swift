//
//  UsersListService.swift
//  USERSFORUM
//
//  Created by Vivek on 15/10/23.
//

import Foundation

protocol UserListDataServiceProtocol {
    func getUserList(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void)
}

final class UserListDataService: UserListDataServiceProtocol {
    func getUserList(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void) {
                
        let url = URL(string: APIEndPoint.fetchUsers.path)
        
        NetworkManager.shared.getRequest(url: url, expecting: [UserInfo].self) { response in
            switch response {
            case .success(let data):
                onCompletion(data, nil)
            case .failure(let error):
                onCompletion(nil, error as? ResponseError)
            }
        }
    }
}
