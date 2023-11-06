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

final class UserDetailView: BaseView, UserDetailViewProtocol {
    enum UserDetailConstants {
        static let cellHeight = 60.0
    }
    
    var presenter: UserDetailPresenterProtocol?
    private var dataForUI: DataForDisplay?
    private var userInfoModel: UserInfo?
    @IBOutlet weak var userDetailTable: UITableView!
    
    init?(coder: NSCoder, presenter: UserDetailPresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    @IBAction func backAction() {
        navigateBack()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        userDetailTable.register(cell: UserDetailTableCell.self)
        self.userDetailTable.dataSource = self
        self.userDetailTable.delegate = self
    }
    
    func displayUserInfo(from model: UserInfo) {
        userInfoModel = model
        DispatchQueue.main.async {[weak self] in
            self?.userDetailTable.reloadData()
        }
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
        return UserDetailConstants.cellHeight
    }
}
