//
//  BaseProtocol.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import Foundation

protocol BaseProtocol { }

extension BaseProtocol {
    static var name: String {
        return String(describing: self)
    }
}
