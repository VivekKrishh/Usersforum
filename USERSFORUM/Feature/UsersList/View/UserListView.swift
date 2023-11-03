//
//  View.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import UIKit

protocol UserListViewProtocol: BaseProtocol {
    func showUsersList(with usersData: [UserInfo]?, error: ResponseError?)
}

final class UserListView: BaseView, UserListViewProtocol {
    enum UserListConstants {
        static let cellHeight = 120.0
    }
    
    // Outlets
    @IBOutlet weak var usersTable: UITableView!
    private var presenter: UserListPresenter?
    
    init?(coder: NSCoder, presenter: UserListPresenter) {
        self.presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private func setupTableView() {
        usersTable.register(cell: UserListTableCell.self)
        self.usersTable.dataSource = self
        self.usersTable.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Initialize Router setup which will intialize all the objects of VIPER
        self.view.addSubview(placeholderLabel)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.fetchUserListDataForView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        placeholderLabel.center = self.view.center
    }
    
    func showUsersList(with usersData: [UserInfo]?, error: ResponseError?) {
        DispatchQueue.main.async { [weak self] in
            if usersData != nil {
                self?.usersTable.reloadData()
            } else {
                self?.placeholderLabel.text = UsersForumApp.errorUnknown.localized
            }
        }
    }
}

extension UserListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getUsersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UserListTableCell.self, for: indexPath)
        guard let userModel = presenter?.getDatasByIndex(index: indexPath.row) else  { return cell }
        cell.configureCell(with: userModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserListConstants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = presenter?.getDatasByIndex(index: indexPath.row) else { return }
        self.presenter?.navigateToDetail(with: item)
    }
}
