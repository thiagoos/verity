//
//  UsersViewModel.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

protocol UsersViewModelProtocol {
    var showLoading: (() -> Void)? { get set }
    var hideLoading: (() -> Void)? { get set }
    var routing: ((UsersRoute) -> Void)? { get set }
    var users: [User]? { get }
    var page: Int { get set }
    var isPageRefreshing: Bool { get set }
    
    func getUsers()
    func getUserDetail(login: String)
}

enum UsersRoute {
    case usersFetched
    case usersError(error: APIError)
    case userDetail(viewModel: UserDetailViewModel)
    case userSearchError(error: APIError)
}

class UsersViewModel: UsersViewModelProtocol {
    //MARK: - Variable
    var showLoading: (() -> Void)?
    var hideLoading: (() -> Void)?
    var routing: ((UsersRoute) -> Void)?
    
    var page: Int = 20
    var isPageRefreshing: Bool = false
    
    private let service: Service?
    var users: [User]?
    var repo: [Repo]?
    var userDetail: User?
    var error: APIError?

    init(service: Service? = Service()) {
        self.service = service
    }
    
    //MARK: - Function
    func getUsers() {
        showLoading?()
        isPageRefreshing = true
    
        service?.fetchUsers(pagination: page) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            self.isPageRefreshing = false
            switch result {
            case .failure(let error):
                self.routing?(.usersError(error: error))
                
            case .success(let users):
                self.users = users
                self.routing?(.usersFetched)
            }
        }
    }
    
    func getUserDetail(login: String) {
        showLoading?()
        error = nil
    
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        service?.fetchUserDetail(login: login) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.error = error
                
            case .success(let user):
                self.userDetail = user
                
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        service?.fetchUserRepo(login: login) { [weak self] result in
            guard let self = self else { return }
        
            switch result {
            case .failure(let error):
                self.error = error
                
            case .success(let repo):
                self.repo = repo
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.hideLoading?()
            
            if let error = self.error {
                self.routing?(.userSearchError(error: error))
                return
            }
            
            guard let userDetail = self.userDetail, let repo = self.repo else { return }
            self.routing?(.userDetail(viewModel: UserDetailViewModel(user: userDetail, repo: repo)))
        }
    }
}

