//
//  Router.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation
import UIKit

typealias EntryPoint = UsersViewProtocol & UIViewController

protocol UserRouterProtocol {
    
    var entry: EntryPoint? { get }
    
    var view: View? { get set }
    
    var presenter: Presenter? { get set }
    
    var interactor: Interactor? { get set }
    
    static func initialSetup(with rootController: View)
    
    func navigateToDetail(with userData: UserInfo)
    
}

class Router: UserRouterProtocol {
    
    var entry: EntryPoint?
    
    var view: View?
    
    var presenter: Presenter?
    
    var interactor: Interactor?
    
    static func initialSetup(with rootController: View) {
        
        let router = Router()
        ///Set Entry Point to define root controller
        router.entry = rootController
        ///Initialize all the View Presenter Interactor Router Objects
        var view: UsersViewProtocol = rootController
        
        var presenter: UserPresenterProtocol = Presenter()
        
        var interactor: UserInteractorProtocol = Interactor()
        
        view.router = router
        view.presenter = presenter as? Presenter
        
        router.view = view as? View
        
        presenter.view = view as? View
        presenter.interactor = interactor as? Interactor
        presenter.router = router
        
        interactor.presenter = presenter as? Presenter
        
    }
    
    func navigateToDetail(with userData: UserInfo) {
        let detailVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: UserDetailView.name)
        self.view?.navigationController?.pushViewController(detailVc, animated: true)
    }
}
