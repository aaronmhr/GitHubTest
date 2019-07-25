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
    
    private enum Constants {
        static let language = "language:swift"
        static let results = "25"
    }
    
    let dependencies: ListInteractorDependenciesProtocol

    init(dependencies: ListInteractorDependenciesProtocol = ListInteractorDependencies()) {
        self.dependencies = dependencies
    }
}

extension ListInteractor: ListInteractorProtocol {
    func urlStringForRepos(page: UInt8) -> URL? {
        let queryItems = [
            URLQueryItem(name: "q", value: Constants.language),
            URLQueryItem(name: "per_page", value: Constants.results),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        guard let stringURL = Endpoints.repos.endpointUrl(with: queryItems)?.absoluteString,
            let url = URL(string: stringURL) else {
                return nil
        }
        return url
    }
    
    func fetchGitHubRepos(url: URL?, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void) {
        guard let url = url else {
            return completion(.failure(APIServiceError.invalidEndpoint))
        }
        return dependencies.repository.retrieveReposList(url: url, completion: { response in
            return completion(response)
        })
    }
}
