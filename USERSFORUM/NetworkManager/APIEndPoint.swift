//
//  APIEndPoint.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

enum APIEndPoint {
    
    case FetchUsers
    
    var path: String {
        switch self {
        case .FetchUsers:
            return APIConstants.users
        }
    }
    
}
