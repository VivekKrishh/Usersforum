//
//  UserDetailConfigurator.swift
//  USERSFORUM
//
//  Created by Vivek on 06/11/23.
//

import Foundation
import UIKit

final class UserDetailConfigurator {
    static func configureView(withSelected userId: Int) -> UserDetailView {
        let router = UserDetailRouter()
        let dataService = UserDetailDataService(selectedUserId: userId)
        let interactor = UserDetailInteractor(userDetailDataService: dataService)
        let presenter = UserDetailPresenter(router: router, interactor: interactor)
        let view = UIStoryboard(name: Storyboard.main.name, bundle: nil).instantiateViewController(identifier: StoryboardIdentifier.userDetail.identifier, creator: { coder in
            return UserDetailView(coder: coder, presenter: presenter)
        })
        router.view = view
        presenter.view = view
        interactor.presenter = presenter
        return view
    }
    
}
