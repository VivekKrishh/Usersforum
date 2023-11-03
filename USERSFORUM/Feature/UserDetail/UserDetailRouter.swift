//
//  UserDetailRouter.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import Foundation
protocol UserDetailRouterProtocol {
    func navigateBack()
}

final class UserDetailRouter: UserDetailRouterProtocol {
    private var view: UserDetailViewProtocol?
    
    func navigateBack() {
        guard let view = self.view as? UserDetailView else { return }
        view.navigationController?.popViewController(animated: true)
    }
}
