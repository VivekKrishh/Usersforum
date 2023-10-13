//
//  NetworkManager.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case responseError(description: String)
    case decodingFailed
}

protocol NetworkProtocol {
    
    func getRequest<T:Codable>(url: URL?, expecting: T.Type, onCompletion:@escaping (Result<T,Error>)-> Void)
    
}

class NetworkManager: NetworkProtocol {
    
    static let shared = NetworkManager()
    
    private init() {
        print("Network Manager Initialized")
    }
    
    func getRequest<T:Codable>(url: URL?, expecting: T.Type, onCompletion:@escaping (Result<T,Error>)-> Void) {
        guard let url = url else {
            onCompletion(.failure(NetworkError.invalidURL))
            return
        }
        
        AF.request(url , method: .get)
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let result = try JSONDecoder().decode(expecting, from: data)
                        onCompletion(.success(result))
                    } catch {
                        print("Failed to parse Json")
                        onCompletion(.failure(NetworkError.decodingFailed))
                    }
                case .failure(let error):
                    onCompletion(.failure(NetworkError.responseError(description: error.localizedDescription)))
                }
            }
        
    }
    
}
