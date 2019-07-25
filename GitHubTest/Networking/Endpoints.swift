//
//  Endpoints.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

enum Endpoints {
    case repos
    case contributors(repoID: String)
    
    func endpointUrl(with items: [URLQueryItem]?) -> URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        switch self {
        case .repos:
            components.path = "\(Path.repos.rawValue)"
        case .contributors(let repoID):
            components.path = String(format: Path.contributors.rawValue, repoID)
        }
        components.queryItems = items
        return components.url
    }
    
    var url: String {
        switch self {
        case .repos:
            return "https://api.github.com/search/repositories?q=language:swift&per_page=25&page=2"
        case .contributors:
            return "https://api.github.com/search/repositories?q=language:swift"
        }
    }
}

extension Endpoints {
    enum Constants {
        static let scheme = "https"
        static let baseURL = "api.github.com"
    }
    
    private enum Path: String {
        case repos = "/search/repositories"
        case contributors = "/repos/%@/contributors"
    }
}
