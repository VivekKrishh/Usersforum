//
//  Presenter.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import Foundation

protocol UserPresenterProtocol {
    
    var view: View? { get set }
    
    var router: Router? { get set }
    
    var interactor: Interactor? { get set }
    
    //Tell interactor to call the API to update the View
    func updateView()
    
}

protocol ViewUserInteractionProtocol {
    
    func navigateToDetail(with userData: UserInfo)
}


class Presenter: UserPresenterProtocol, ViewUserInteractionProtocol {

    var view: View?
    
    var router: Router?
    
    var interactor: Interactor?
    
    func updateView() {
        self.interactor?.getUsersInfoFromAPI(onCompletion: { result in
            switch result {
            case .success(let data):
                self.view?.updateUI(with: data, error: nil)
            case .failure(let error):
                self.view?.updateUI(with: nil, error: error)
            }
        })
    }
    
    func navigateToDetail(with userData: UserInfo) {
        self.router?.navigateToDetail(with: userData)
    }
    
}
