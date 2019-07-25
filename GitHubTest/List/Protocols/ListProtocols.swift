//
//  ListProtocols.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

protocol ListInteractorProtocol: class {
    func fetchGitHubRepos(url: URL?, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void)
    func urlStringForRepos(page: UInt8) -> URL?
}

protocol ListRouterProtocol: class {
    func showDetailViewForRepo(_ repoModel: GitHubRepoModel)
}

protocol ListPresenterProtocol: class {
    func viewDidLoad()
    func didSelectRowAtIndex(_ index: Int)
    func loadData()
    func refreshTable()
}

protocol ListViewProtocol: Coverable {
    var navigationBarTitle: String? { get set }
    var githubRepos:[GitHubRepoCellModel] { get set }
}

protocol Coverable: class {
    var fullScreenView: UIView { get }
    func addFullScreenLoadingView()
    func removeFullScreenLoadingView()
}
