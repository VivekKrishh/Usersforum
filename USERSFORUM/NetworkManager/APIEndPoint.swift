//
//  APIEndPoint.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

enum APIEndPoint {
    
    case fetchUsers
    
    var path: String {
        switch self {
        case .fetchUsers:
            return APIConstants.users
        }
    }
    
}
