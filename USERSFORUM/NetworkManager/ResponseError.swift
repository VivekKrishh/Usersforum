//
//  ResponseError.swift
//  USERSFORUM
//
//  Created by Vivek on 15/10/23.
//

import Foundation

enum ResponseError: Error {
    case invalidURL
    case decoding
    case unexpectedStatusCode
    
    var description: String {
        switch self {
        case .invalidURL:
            return UsersForumApp.errorInvalidEndPoint.localized
        case .decoding:
            return UsersForumApp.errorRemoteDataParsingFailed.localized
        case .unexpectedStatusCode:
            return UsersForumApp.errorUnknown.localized
        }
    }
}
