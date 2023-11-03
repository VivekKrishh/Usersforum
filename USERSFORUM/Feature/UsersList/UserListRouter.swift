//
//  Router.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation
import UIKit

protocol UserListRouterProtocol {
    func navigateToDetail(with userData: UserInfo)
}

class UserListRouter: UserListRouterProtocol {
    private var view: UserListViewProtocol?
    
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
    
    func navigateToDetail(with userData: UserInfo) {
        let detailVc: UserDetailView = UIStoryboard.instantiate(identifier: .userDetail)
        detailVc.displayUserInfo(from: userData)
        guard let view = self.view as? UserListView else { return }
        view.navigationController?.pushViewController(detailVc, animated: true)
    }
}
