//
//  UserListConfigurator.swift
//  USERSFORUM
//
//  Created by Vivek on 06/11/23.
//

import Foundation
import UIKit

final class UserListConfigurator {
    static func configureView() -> UserListView {
        let router = UserListRouter()
        let interactor = UserListInteractor()
        let presenter = UserListPresenter(router: router, interactor: interactor)
        let view = UIStoryboard(name: Storyboard.main.name, bundle: nil).instantiateViewController(identifier: StoryboardIdentifier.usersList.identifier, creator: { coder in
            return UserListView(coder: coder, presenter: presenter)
        })
        router.view = view
        presenter.view = view
        interactor.presenter = presenter
        return view
    }
}
