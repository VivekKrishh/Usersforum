//
//  UserDetailView.swift
//  USERSFORUM
//
//  Created by Vivek on 13/10/23.
//

import Foundation
import UIKit

protocol UserDetailViewProtocol: BaseProtocol {
    var presenter: UserDetailPresenterProtocol? { get set }
    func displayUserInfo(from model: UserInfo)
    func navigateBack()
}

enum DataForDisplay: String, CaseIterable {
    case name
    case username
    case email
    case address
    case phone
    case website
}

class  UserDetailView: UIViewController, UserDetailViewProtocol {
    var presenter: UserDetailPresenterProtocol?
    private var dataForUI: DataForDisplay?
    private var userInfoModel: UserInfo?
    @IBOutlet private weak var userDetailTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setDataSourcesAndDelegates()
    }
    
    private func registerNibs() {
        userDetailTable.register(cell: UserDetailTableCell.self)
    }
    
    private func setDataSourcesAndDelegates() {
        self.userDetailTable.dataSource = self
        self.userDetailTable.delegate = self
    }
    
    func displayUserInfo(from model: UserInfo) {
        print("Model : \(model.description)")
        userInfoModel = model
    }
    
    func navigateBack() {
        guard let presenter = self.presenter as? UserDetailPresenter else { return }
        presenter.navigateBack()
    }
}

extension UserDetailView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataForDisplay.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UserDetailTableCell.self, for: indexPath)
        
        guard let userInfoModel = userInfoModel else { return cell }
        
        cell.configureCell(with: DataForDisplay.allCases[indexPath.row], model: userInfoModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
