//
//  UserDetailRouter.swift
//  USERSFORUM
//
//  Created by Vivek on 19/10/23.
//

import Foundation

protocol UserDetailRouterProtocol {
    var entry: EntryPoint? { get }
    var view: UserDetailViewProtocol? { get set }
    var presenter: UserDetailPresenterProtocol? { get set }
    var interactor: UserDetailInteractorProtocol? { get set }
    
    func navigateBack()
}

class UserDetailRouter: UserDetailRouterProtocol {
    var entry: EntryPoint?
    var view: UserDetailViewProtocol?
    var presenter: UserDetailPresenterProtocol?
    var interactor: UserDetailInteractorProtocol?
    
    func navigateBack() {
        guard let view = self.view as? UserDetailView else { return }
        view.navigationController?.popViewController(animated: true)
    }
}
