//
//  API.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

class API {
    private let baseURL = "https://api.github.com"
    
    enum CallType {
        case users(pagination: Int)
        case userDetail(login: String)
        case repo(login: String)
    }
    
    func callWithType(type: CallType) -> String {
        switch type {
        case .users(let pagination):
            return "\(baseURL)/users?per_page=\(pagination)"
            
        case .userDetail(let login):
            return "\(baseURL)/users/\(login)"
            
        case .repo(let login):
            return "\(baseURL)/users/\(login)/repos"
            
        }
    }
}

extension API: APIProtocol {
    func fetchUsers(pagination: Int, completion: @escaping (Result<[User], APIError>) -> Void) {
        guard let url = URL(string: callWithType(type: .users(pagination: pagination))) else {
            completion(.failure(.jsonError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.jsonError))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(.failure(.jsonError))
                    return
                }
            }
            guard let json = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.jsonError))
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion(.success(json))
            }
        }
        task.resume()
        
    }
    
    func fetchUserDetail(login: String, completion: @escaping (Result<User, APIError>) -> Void) {
        guard let url = URL(string: callWithType(type: .userDetail(login: login))) else {
            completion(.failure(.jsonError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.invalidURL))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(.failure(.invalidURL))
                    return
                }
            }
            guard let json = try? JSONDecoder().decode(User.self, from: data) else {
                completion(.failure(.invalidURL))
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion(.success(json))
            }
        }
        task.resume()
        
    }
    
    func fetchUserRepo(login: String, completion: @escaping (Result<[Repo], APIError>) -> Void) {
        guard let url = URL(string: callWithType(type: .repo(login: login))) else {
            completion(.failure(.jsonError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.invalidURL))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(.failure(.invalidURL))
                    return
                }
            }
            guard let json = try? JSONDecoder().decode([Repo].self, from: data) else {
                completion(.failure(.invalidURL))
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion(.success(json))
            }
        }
        task.resume()
        
    }
}


