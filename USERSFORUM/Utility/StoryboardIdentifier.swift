//
//  StoryboardIdentifier.swift
//  USERSFORUM
//
//  Created by Vivek on 16/10/23.
//

import Foundation

enum Storyboard: String {
    case main = "Main"
    var name: String {
        switch self {
        case .main:
            return self.rawValue
        }
    }
}

enum StoryboardIdentifier: String {
    case usersList
    case userDetail
    
    var identifier: String {
        switch self {
        case .usersList:
            return self.rawValue
        case .userDetail:
            return self.rawValue
        }
    }
}
