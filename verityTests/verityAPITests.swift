//
//  verityAPITests.swift
//  verityTests
//
//  Created by Thiago Soares on 15/06/23.
//

import XCTest
@testable import verity

final class verityAPITests: XCTestCase {
    
    var sut: API!

    override func setUpWithError() throws {
        sut = API()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testServiceFetchUsers() {
        let expectation = XCTestExpectation(description: "Users downloaded")

        var responseError: Error?
        var responseUsers: [User]?

        sut.fetchUsers(pagination: 10) { result in
            switch result {
            case .failure(let error):
                responseError = error

            case .success(let users):
                responseUsers = users
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseUsers)
    }

    func testServiceFetchUserDetails() {
        let expectation = XCTestExpectation(description: "User detail downloaded")

        var responseError: Error?
        var responseUser: User?

        sut.fetchUserDetail(login: "mojombo") { result in
            switch result {
            case .failure(let error):
                responseError = error

            case .success(let user):
                responseUser = user
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseUser)
    }

    func testServiceFetchUserRepositories() {
        let expectation = XCTestExpectation(description: "User repositories downloaded")

        var responseError: Error?
        var responseRepos: [Repo]?

        sut.fetchUserRepo(login: "mojombo") { result in
            switch result {
            case .failure(let error):
                responseError = error

            case .success(let repos):
                responseRepos = repos
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseRepos)
    }
}
