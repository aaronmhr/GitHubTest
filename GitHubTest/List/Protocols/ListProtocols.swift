//
//  ListProtocols.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

protocol ListInteractorProtocol: class {
    func fetchGitHubRepos(completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void)
}

protocol ListRouterProtocol: class {
}

protocol ListPresenterProtocol: class {
    func viewDidLoad()
    func didSelectRowAtIndex(_ index: Int)
    func shouldLoadMoreRows()
}

protocol ListViewProtocol: class {
    var navigationBarTitle: String? { get set }
    var githubRepos:[GitHubRepoCellModel] { get set }
}
