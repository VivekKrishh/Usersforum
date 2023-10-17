//
//  UserInfo.swift
//  USERSFORUM
//
//  Created by Pearlarc on 17/10/23.
//

import Foundation

// MARK: - UserInfo
struct UserInfo: Codable, CustomStringConvertible {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    var description: String {
        return "id:\(id) - name:\(name) - username:\(username) - email:\(email) - address:\(address) - phone:\(phone)"
    }
    
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
