//
//  GitHubResponseModel.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

struct Response: Codable {
    let totalCount: Int?
    let items: [RepoResponse]?
}

// MARK: - RepoResponse
struct RepoResponse: Codable {
    let id: Int?
    let name, fullName: String?
    let size, stargazersCount, forksCount: Int?
    let contributorsURL: String?
}


extension RepoResponse {
    var asGitHubRepoModel: GitHubRepoModel? {
        guard let name = self.name,
            let fullName = self.fullName else {
                return nil
        }
        return GitHubRepoModel(name: name, fullName: fullName)
    }
}
