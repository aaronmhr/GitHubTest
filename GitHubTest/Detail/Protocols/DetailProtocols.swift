//
//  DetailProtocols.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

protocol DetailInteractorProtocol {
    var repoModel: GitHubRepoModel { get }
    func fetchContributorsList(url: URL?, completion: @escaping (Result<[Contributor], APIServiceError>) -> Void)
}

protocol DetailRouterProtocol {
}

protocol DetailPresenterProtocol {
    func viewDidLoad()
}

protocol DetailViewProtocol: Coverable {
    var viewModel: DetailViewViewModel? { get set }
}
