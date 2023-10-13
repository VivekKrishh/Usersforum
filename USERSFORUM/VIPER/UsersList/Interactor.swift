//
//  Interactor.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

protocol UserInteractorProtocol {
    
    var presenter: Presenter? { get set }
    
    func getUsersInfoFromAPI(onCompletion: @escaping (Result<[UserInfo],NetworkError>) -> Void)
}

class Interactor: UserInteractorProtocol {
    
    var presenter: Presenter?
    
    func getUsersInfoFromAPI(onCompletion: @escaping (Result<[UserInfo],NetworkError>) -> Void) {
                
        let url = URL(string: APIEndPoint.FetchUsers.path)
        
        NetworkManager.shared.getRequest(url: url, expecting: [UserInfo].self) { response in
            switch response {
            case .success(let data):
                onCompletion(.success(data))
            case .failure(let error):
                onCompletion(.failure(NetworkError.responseError(description: error.localizedDescription)))
            }
        }
    }
    
}

