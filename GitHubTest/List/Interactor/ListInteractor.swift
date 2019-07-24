//
//  ListInteractor.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//
import Foundation

protocol ListInteractorDependenciesProtocol {
    var repository: GitHubRepositoryProtocol { get }
}

final class ListInteractorDependencies: ListInteractorDependenciesProtocol {
    lazy var repository: GitHubRepositoryProtocol = GitHubRepository()
    
}

final class ListInteractor {
    let dependencies: ListInteractorDependenciesProtocol

    init(dependencies: ListInteractorDependenciesProtocol = ListInteractorDependencies()) {
        self.dependencies = dependencies
    }
}

extension ListInteractor: ListInteractorProtocol {
    private var url: URL? {
        guard let url = URL(string: Endpoints.swiftRepos.url) else {
            return nil
        }
        return url
    }
    
    func fetchGitHubRepos(completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void) {
        guard let url = url else {
            return completion(.failure(APIServiceError.invalidEndpoint))
        }
        return dependencies.repository.retrieveReposList(url: url, completion: { response in
            return completion(response)
        })
    }
}
