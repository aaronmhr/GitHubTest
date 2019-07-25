
//
//  GitHubRepositoryProtocol.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

protocol GitHubRepositoryProtocol {
    func retrieveReposList(url: URL, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void)
    func retrieveContributorsList(url: URL, completion: @escaping (Result<[Contributor], APIServiceError>) -> Void)
}
