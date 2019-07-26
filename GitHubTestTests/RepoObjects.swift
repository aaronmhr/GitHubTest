//
//  RepoObjects.swift
//  GitHubTestTests
//
//  Created by Aaron Huánuco on 26/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

@testable import GitHubTest
import XCTest

class RepoObjects: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testResponseToModel() {
        let responseRepo1 = RepoResponse(id: 1, name: "awesome-ios", fullName: "vsouza/awesome-ios", size: 9598, stargazersCount: 32404, forksCount: 5439, contributorsUrl: "https://api.github.com/repos/vsouza/awesome-ios/contributors")
        let model1 = responseRepo1.asGitHubRepoModel
        XCTAssertNotNil(model1)
        XCTAssertEqual(model1, TestingObjects.repo1)
        let responseRepo2 = RepoResponse(id: 1, name: nil, fullName: "vsouza/awesome-ios", size: 9598, stargazersCount: 32404, forksCount: 5439, contributorsUrl: "https://api.github.com/repos/vsouza/awesome-ios/contributors")
        let model2 = responseRepo2.asGitHubRepoModel
        XCTAssertNil(model2)
    }
    
    func testContributorResponseToModel() {
        let response1 = ContributorResponse(login: "vsouza", avatarUrl: "https://avatars0.githubusercontent.com/u/6511079?v=4")
        XCTAssertNotNil(response1.asContributor)
        let response2 = ContributorResponse(login: nil, avatarUrl: "https://avatars0.githubusercontent.com/u/6511079?v=4")
        XCTAssertNil(response2.asContributor, "If there is no name return nil")
        let response3 = ContributorResponse(login: "vsouza", avatarUrl: nil)
        XCTAssertNotNil(response3.asContributor)
    }
}
