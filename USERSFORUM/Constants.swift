//
//  Constants.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

struct Constants {
    
    struct StringConstants {
        
        struct ErrorMessage {
            static let somethingWentWrong = "Something went wrong"
        }
        
    }
    
    struct API {
        
        static let baseURL = "https://jsonplaceholder.typicode.com/"
        
        static let users = baseURL + "users"
    }
    
}
