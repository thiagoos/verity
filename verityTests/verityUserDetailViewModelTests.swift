//
//  verityUserDetailViewModelTests.swift
//  verityTests
//
//  Created by Thiago Soares on 15/06/23.
//

import XCTest
@testable import verity

final class verityUserDetailViewModelTests: XCTestCase {
    var sut: UserDetailViewModel?

    override func setUpWithError() throws {
        let repoMock = [Repo(id: 163880832, name: "docker-overpass-api", description: "A fully working overpass-api docker image: cloning, replication, areas and www interface", visibility: "public", html_url: "https://github.com/Mojambo/docker-overpass-api", language: "Shell")]
        let userMock = User(name: "mojambo", company: "@DieSoftwaregaertnerGmbH", twitter_username: nil, location: nil, blog: nil, followers: 1, following: 1)
        sut = UserDetailViewModel(user: userMock, repo: repoMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testObjectsIsNotNull() {
        XCTAssertNotNil(sut?.repo)
        XCTAssertNotNil(sut?.user)
    }
}
