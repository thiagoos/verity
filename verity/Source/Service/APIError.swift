//
//  APIError.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case network(Error?)
    case jsonError
    
    func messageError() -> String {
        switch self {
        case .jsonError:
            return "Problema com a conexão"
            
        case .network:
            return "Problema com a conexão"
            
        case .invalidURL:
            return "A pesquisa realizada de usuário não encontrou resultado."
        }
    }
}
