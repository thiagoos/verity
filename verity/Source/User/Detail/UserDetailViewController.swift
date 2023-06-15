//
//  UserDetailViewController.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class UserDetailViewController: BaseViewController {
    //MARK: - Variable
    private var viewModel: UserDetailViewModelProtocol
    fileprivate var constraintHeightTableView: NSLayoutConstraint?
    
    fileprivate let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    fileprivate let viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let userHeader: UserDetailHeader = {
        let view = UserDetailHeader()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelRepositories: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .left
        label.text = "Repositories"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Life cycle
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupUI()
    }
    
    //MARK: - Variable
    fileprivate func setupController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        guard let user = self.viewModel.user else { return }
        userHeader.setupData(user: user)
    }
    
    fileprivate func setupUI() {
        labelRepositories.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(viewContainer)
        
        viewContainer.addSubview(userHeader)
        viewContainer.addSubview(labelRepositories)
        viewContainer.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            viewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            userHeader.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            userHeader.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            userHeader.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            
            labelRepositories.topAnchor.constraint(equalTo: userHeader.bottomAnchor, constant: 24),
            labelRepositories.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 32),
            labelRepositories.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -32),
            
            tableView.topAnchor.constraint(equalTo: labelRepositories.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),
        ])
        self.labelRepositories.isHidden = self.viewModel.repo?.count == 0
        let height = (self.viewModel.repo?.count ?? 0) * 140
        self.constraintHeightTableView = self.tableView.heightAnchor.constraint(equalToConstant: CGFloat(height))
        self.constraintHeightTableView?.isActive = true
    }
}

//MARK: - UITableViewDataSource
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.reuseIdentifier, for: indexPath) as? RepoTableViewCell,
              let repo = self.viewModel.repo,
              indexPath.row < repo.count else { return UITableViewCell() }
    
        cell.setupData(repo: repo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.repo?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

