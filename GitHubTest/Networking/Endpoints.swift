//
//  Endpoints.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

enum Endpoints {
    case swiftRepos
    case contributors
    
    var url: String {
        switch self {
        case .swiftRepos:
            return "https://api.github.com/search/repositories?q=language:swift"
        case .contributors:
            return "https://api.github.com/search/repositories?q=language:swift"
        }
    }
}
