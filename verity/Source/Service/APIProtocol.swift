//
//  APIProtocol.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

protocol APIProtocol {
    func fetchUsers(pagination: Int, completion: @escaping (Result<[User], APIError>) -> Void)
    func fetchUserDetail(login: String, completion: @escaping (Result<User, APIError>) -> Void)
    func fetchUserRepo(login: String, completion: @escaping (Result<[Repo], APIError>) -> Void)
}
