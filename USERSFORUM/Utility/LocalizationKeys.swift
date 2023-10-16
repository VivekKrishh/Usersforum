//
//  LocalizationKeys.swift
//  USERSFORUM
//
//  Created by Vivek on 15/10/23.
//

import Foundation

protocol Localized {
    var localized: String  { get }
}

enum UsersForumApp: String , Localized {
        
    case errorRemoteDataParsingFailed
    
    case errorInvalidEndPoint
    
    case errorUnknown
    
    var localized: String {
        self.rawValue.localized
    }
    
}
