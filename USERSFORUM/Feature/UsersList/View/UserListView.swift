//
//  View.swift
//  USERSFORUM
//
//  Created by Vivek on 12/10/23.
//

import UIKit

protocol UsersViewProtocol {
    
    var presenter: UserListPresenter? { get set }
    
    var router: UserListRouter? { get set }
    
    func updateUI(with usersData: [UserInfo]?, error: ResponseError?)
    
}

class UserListView: UIViewController, UsersViewProtocol {
    
    // Outlets
    @IBOutlet weak var usersTable: UITableView!
    
    var presenter: UserListPresenter?
    
    var router: UserListRouter?
    
    private var users: [UserInfo] = []

    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    func setDataSourcesAndDelegates() {
        self.usersTable.dataSource = self
        self.usersTable.delegate = self
    }
    
    func registerNibs() {
        usersTable.register(cell: UserListTableCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Initialize Router setup which will intialize all the objects of VIPER
        UserListRouter.initialSetup(with: self)
        
        self.view.addSubview(placeholderLabel)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        registerNibs()
        setDataSourcesAndDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.updateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        placeholderLabel.center = self.view.center
    }
    

    func updateUI(with usersData: [UserInfo]?, error: ResponseError?) {
        DispatchQueue.main.async { [weak self] in
            if let usersData = usersData {
                self?.users = usersData
                self?.usersTable.reloadData()
            } else {
                self?.placeholderLabel.text = UsersForumApp.errorUnknown.localized
            }
        }
    }

}

extension UserListView {
    static var name: String {
       return String(describing: self)
    }
}

extension UserListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UserListTableCell.self, for: indexPath)
        
        let user = users.item(at: indexPath.row)
        cell.labelName.text = user?.name ?? ""
        cell.labelCity.text = user?.address.city ?? ""
        cell.labelPhoneNumber.text = user?.phone ?? ""
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = users.item(at: indexPath.row) else { return }
        self.presenter?.navigateToDetail(with: item)
    }
}
