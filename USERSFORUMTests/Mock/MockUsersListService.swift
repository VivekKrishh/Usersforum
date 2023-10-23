//
//  MockUsersListService.swift
//  USERSFORUM
//
//  Created by Vivek on 17/10/23.
//

import Foundation

enum ResponseState {
    case success
    case failure
}

final class MockUsersListService: UserListDataServiceProtocol {
    var responseState: ResponseState = .success
    
    func getUserList(onCompletion: @escaping ([UserInfo]?, ResponseError?) -> Void) {
        guard let mockFileURL = Bundle.main.url(forResource: "UsersListResponse", withExtension: ".json") else {
            return
        }
        
        guard let userListsDataFromFile = try? Data(contentsOf: mockFileURL) else {
            return
        }
        
        let usersListJson = try? JSONDecoder().decode([UserInfo].self, from: userListsDataFromFile)
        
        switch responseState {
        case .success:
            onCompletion(usersListJson, nil)
        case .failure:
            onCompletion(nil, ResponseError.unexpectedStatusCode)
            
        }
    }
}
