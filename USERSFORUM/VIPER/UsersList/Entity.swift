//
//  Entity.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode([UserInfo].self, from: jsonData)

import Foundation

// MARK: - UserData
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


