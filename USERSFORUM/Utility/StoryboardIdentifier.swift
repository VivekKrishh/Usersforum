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
    case usersList
    
    case userDetail
    
    var storyboardName: String {
        switch self {
        case .usersList, .userDetail:
            return Storyboard.main.rawValue
        }
    }
}
