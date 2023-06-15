//
//  verityUsersModelTests.swift
//  verityTests
//
//  Created by Thiago Soares on 15/06/23.
//

import XCTest
@testable import verity

final class verityUsersModelTests: XCTestCase {
    var sut: UsersViewModel?

    override func setUpWithError() throws {
        let apiMock = APIMock()
        let service = Service(api: apiMock)
        sut = UsersViewModel(service: service)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testServiceFetchUsersWithMockData() {
        sut?.getUsers()
        XCTAssertNotNil(sut?.users)
    }
    
    func testServiceFetchUserDetailWithMockData() {
        sut?.getUserDetail(login: "mojambo")
        XCTAssertNotNil(sut?.userDetail)
        XCTAssertNotNil(sut?.repo)
    }
}
