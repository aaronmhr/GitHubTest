//
//  GitHubRepoModel.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

struct GitHubRepoModel: Equatable {
    let name: String
    let fullName: String
    let size: Int
    let stargazersCount: Int
    let forksCount: Int
    let contributorsURL: String
}
