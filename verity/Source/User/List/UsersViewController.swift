//
//  UsersViewController.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class UsersViewController: BaseViewController {
    //MARK: - Variable
    private var viewModel: UsersViewModelProtocol
    
    //MARK: - UI
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UsersCollectionViewCell.self, forCellWithReuseIdentifier: UsersCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - Life cycle
    init(viewModel: UsersViewModel = UsersViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        setupController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Functions
    fileprivate func setupController() {
        view.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        collectionView.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title = "GitHub Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(buttonSearchTapped))
        
        viewModel.getUsers()
    }
    
    @objc fileprivate func buttonSearchTapped() {
        let alertController = UIAlertController(title: "Pesquisa", message: "Digite o nome do usuário github para uma pesquisa", preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Digite aqui"
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        let searchAction = UIAlertAction(title: "Buscar", style: .default) { [weak self] _ in
            guard let self = self else { return }
            if let text = alertController.textFields?.first?.text {
                self.viewModel.getUserDetail(login: text)
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(searchAction)

        present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func setupUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    fileprivate func bindUI() {
        self.viewModel.showLoading = { [weak self] in
            guard let self = self else { return }
            self.loadingView.startLoading(in: self.view)
        }
        
        self.viewModel.hideLoading = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.loadingView.stopLoading(in: self.view)
            }
        }
        
        self.viewModel.routing = { [weak self] route in
            switch route {
            case .userDetail(let viewModel):
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.pushViewController(UserDetailViewController(viewModel: viewModel), animated: true)
                    
                }
                
            case .usersFetched:
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.collectionView.reloadData()
                }
                
            case .usersError(let error):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.errorView.configure(in: self.view, title: "Erro", description: error.messageError(), actionTitle: "Tentar novamente")
                    self.errorView.actionButtonTapped = { [weak self] in
                        self?.viewModel.getUsers()
                    }
                }
            case .userSearchError(let error):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.errorView.configure(in: self.view, title: "Erro", description: error.messageError(), actionTitle: "Ok")
                    self.errorView.actionButtonTapped = { [weak self] in
                        self?.errorView.hide()
                    }
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if (self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
           if !self.viewModel.isPageRefreshing {
               self.viewModel.page += 10
               self.viewModel.getUsers()
           }
       }
   }
}

//MARK: - UICollectionViewDataSource
extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.users?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCollectionViewCell.reuseIdentifier, for: indexPath) as? UsersCollectionViewCell,
              let users = self.viewModel.users,
              indexPath.row < users.count
        else { return UICollectionViewCell() }
        
        cell.setupData(user: users[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let login = self.viewModel.users?[indexPath.row].login else { return }
        self.viewModel.getUserDetail(login: login)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension UsersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (view.frame.width / 2) - 24, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}
