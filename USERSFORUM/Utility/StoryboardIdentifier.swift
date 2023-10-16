//
//  StoryboardIdentifier.swift
//  USERSFORUM
//
//  Created by Vivek on 16/10/23.
//

import Foundation

enum Storyboard: String {
    case main = "Main"
}

enum StoryboardIdentifier: String {
    
    case UsersList
    
    case UserDetail
    
    var storyboardName: String {
        switch self {
        case .UsersList, .UserDetail:
            return Storyboard.main.rawValue
        }
    }
}
