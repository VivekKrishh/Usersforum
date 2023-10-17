//
//  Router.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation
import UIKit

typealias EntryPoint = UsersViewProtocol & UIViewController

protocol UserListRouterProtocol {
    
    var entry: EntryPoint? { get }
    
    var view: UserListView? { get set }
    
    var presenter: UserListPresenter? { get set }
    
    var interactor: UserListInteractor? { get set }
    
    static func initialSetup(with rootController: UserListView)
    
    func navigateToDetail(with userData: UserInfo)
    
}

class UserListRouter: UserListRouterProtocol {
    
    var entry: EntryPoint?
    
    var view: UserListView?
    
    var presenter: UserListPresenter?
    
    var interactor: UserListInteractor?
    
    static func initialSetup(with rootController: UserListView) {
        
        let router = UserListRouter()
        /// Set Entry Point to define root controller
        router.entry = rootController
        /// Initialize all the View Presenter Interactor Router Objects
        var view: UsersViewProtocol = rootController
        
        var presenter: UserListPresenterProtocol = UserListPresenter()
        
        let interactor: UserListInteractorProtocol = UserListInteractor(presenter: presenter as? UserListPresenter)
        
        view.router = router
        view.presenter = presenter as? UserListPresenter
        
        router.view = view as? UserListView
        
        presenter.view = view as? UserListView
        presenter.interactor = interactor as? UserListInteractor
        presenter.router = router
                
    }
    
    func navigateToDetail(with userData: UserInfo) {
        let detailVc: UserDetailView = UIStoryboard.instantiate(identifier: .userDetail)
        self.view?.navigationController?.pushViewController(detailVc, animated: true)
    }
}
