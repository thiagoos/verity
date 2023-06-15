//
//  Service.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

class Service {
    private let api: APIProtocol
    
    init(api: APIProtocol? = API()) {
        if let api = api {
            self.api = api
        } else {
            self.api = API()
        }
    }
    
    func fetchUsers(pagination: Int, completion: @escaping (Result<[User], APIError>) -> Void) {
        api.fetchUsers(pagination: pagination, completion: completion)
    }
   
    func fetchUserDetail(login: String, completion: @escaping (Result<User, APIError>) -> Void) {
        api.fetchUserDetail(login: login, completion: completion)
    }
    func fetchUserRepo(login: String, completion: @escaping (Result<[Repo], APIError>) -> Void) {
        api.fetchUserRepo(login: login, completion: completion)

    }
}

