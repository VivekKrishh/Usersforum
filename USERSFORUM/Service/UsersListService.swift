//
//  UsersListService.swift
//  USERSFORUM
//
//  Created by Pearlarc on 15/10/23.
//

import Foundation

protocol UsersListServiceProtocol {
   
    func getUsersInfoFromAPI(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void)
    
}

final class UsersListService : UsersListServiceProtocol {
    
    func getUsersInfoFromAPI(onCompletion:@escaping (_ data: [UserInfo]?, _ error: ResponseError?) -> Void) {
                
        let url = URL(string: APIEndPoint.FetchUsers.path)
        
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

