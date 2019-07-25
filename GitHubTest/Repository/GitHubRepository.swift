//
//  GitHubRepository.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation


protocol GitHubDependenciesProtocol {
    var apiService: APIService { get }
}

final class GitHubDependencies: GitHubDependenciesProtocol {
    lazy var apiService = APIService()
}

final class GitHubRepository: GitHubRepositoryProtocol {
    let dependencies: GitHubDependenciesProtocol
    
    init(dependencies: GitHubDependenciesProtocol = GitHubDependencies()) {
        self.dependencies = dependencies
    }
    
    func retrieveReposList(url: URL, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void) {
        self.dependencies.apiService.fetchResources(url: url) { (result: Result<Response, APIServiceError>) in
            switch result {
            case .success(let response):
                guard let repos = response.items else {
                    completion(.failure(.invalidResponse))
                    return
                }
                let reposArray = repos.compactMap { $0.asGitHubRepoModel}
                completion(.success(reposArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func retrieveContributorsList(url: URL, completion: @escaping (Result<[Contributor], APIServiceError>) -> Void) {
        self.dependencies.apiService.fetchResources(url: url) { (result: Result<[ContributorResponse], APIServiceError>) in
            switch result {
            case .success(let response):
                let reposArray = response.compactMap { $0.asContributor }
                completion(.success(reposArray))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
