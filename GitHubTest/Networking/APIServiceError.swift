//
//  APIServiceError.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

enum APIServiceError: Error, Equatable {
    case apiError(String)
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

extension APIServiceError: CustomStringConvertible {
    var description: String {
        switch self {
        case .apiError:
            return "Could not reach API successfully"
        case .invalidEndpoint:
            return "Could not build propper URL"
        case .invalidResponse:
            return "Could not get propper response"
        case .noData:
            return "Could not find data"
        case .decodeError:
            return "Could not decode data"
        }
    }
}
