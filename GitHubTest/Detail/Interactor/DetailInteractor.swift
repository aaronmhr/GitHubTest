//
//  DetailInteractor.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

protocol DetailInteractorDependenciesProtocol {
    var repository: GitHubRepositoryProtocol { get }
}

final class DetailInteractorDependencies: DetailInteractorDependenciesProtocol {
    lazy var repository: GitHubRepositoryProtocol = GitHubRepository()
}

final class DetailInteractor {
    let dependencies: DetailInteractorDependenciesProtocol
    let repoModel: GitHubRepoModel

    init(repoModel: GitHubRepoModel, dependencies: DetailInteractorDependenciesProtocol = DetailInteractorDependencies()) {
        self.dependencies = dependencies
        self.repoModel = repoModel
    }
}

extension DetailInteractor: DetailInteractorProtocol {
    func fetchContributorsList(url: URL?, completion: @escaping (Result<[Contributor], APIServiceError>) -> Void) {
        guard let url = url else {
            return completion(.failure(APIServiceError.invalidEndpoint))
        }
        return dependencies.repository.retrieveContributorsList(url: url, completion: { response in
            return completion(response)
        })
    }
}
