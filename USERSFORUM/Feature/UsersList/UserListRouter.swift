//
//  Router.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation
import UIKit

protocol UserListRouterProtocol {
    func navigateToUserDetail(with userData: UserInfo)
}

final class UserListRouter: UserListRouterProtocol {
    var view: UserListViewProtocol?
    
    func navigateToUserDetail(with userData: UserInfo) {
        let detailVc: UserDetailView = UserDetailConfigurator.configureView(withSelected: userData.id)
        detailVc.displayUserInfo(from: userData)
        guard let view = self.view as? UserListView else { return }
        view.navigationController?.pushViewController(detailVc, animated: true)
    }
}
