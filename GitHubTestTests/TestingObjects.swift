//
//  TestingObjects.swift
//  GitHubTestTests
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation
@testable import GitHubTest

enum TestingObjects {
    static let repo1 = GitHubRepoModel(name: "awesome-ios",
                                      fullName: "vsouza/awesome-ios",
                                      size: 9598,
                                      stargazersCount: 32404,
                                      forksCount: 5439,
                                      contributorsURL: "https://api.github.com/repos/vsouza/awesome-ios/contributors")
    static let repo2 = GitHubRepoModel(name: "awesome-swift",
                                       fullName: "rSouza/awesome-swift",
                                       size: 1,
                                       stargazersCount: 11,
                                       forksCount: 111,
                                       contributorsURL: "https://api.github.com/repos/rsouza/awesome-swift/contributors")
    static let contributor = Contributor(name: "vsouza", imageStringURL: "https://avatars0.githubusercontent.com/u/6511079?v=4")
}
