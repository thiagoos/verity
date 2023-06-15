//
//  Repo.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import Foundation

struct Repo: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let visibility: String?
    let html_url: String?
    let language: String?
}

