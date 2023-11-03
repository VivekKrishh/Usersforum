//
//  UserDetailInteractor.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation

protocol UserDetailInteractorProtocol {
    var presenter: UserDetailPresenter? { get set }
}

final class UserDetailInteractor: UserDetailInteractorProtocol {
    var presenter: UserDetailPresenter?
    
    init(presenter: UserDetailPresenter? = nil) {
        self.presenter = presenter
    }
}
