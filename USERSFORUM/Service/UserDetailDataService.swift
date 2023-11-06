//
//  UserDetailDataService.swift
//  USERSFORUM
//
//  Created by Vivek on 06/11/23.
//

import Foundation

protocol UserDetailDataServiceProtocol {
    func fetchUserDetails(onCompletion: @escaping ( _ data: UserInfo?, _ error: ResponseError?) -> Void)
}

final class UserDetailDataService: UserDetailDataServiceProtocol {
    private let selectedUserId: Int
    init(selectedUserId: Int = 0) {
        self.selectedUserId = selectedUserId
    }
    // Don't have api for "user details" so created this method for demonstration purposes
    func fetchUserDetails(onCompletion: @escaping ( _ data: UserInfo?, _ error: ResponseError?) -> Void) {
        onCompletion(UserInfo(id: 2, name: "Ervin Howell", username: "Antonette", email: "Shanna@melissa.tv", address: Address(street: "Victor Plains", suite: "Suite 879", city: "Wisokyburgh", zipcode: "90566-7771", geo: Geo(lat: "-43.9509", lng: "-34.4618")), phone: "010-692-6593 x09125", website: "anastasia.net", company: Company(name: "Deckow-Crist", catchPhrase: "Proactive didactic contingency")), nil)
    }
}
