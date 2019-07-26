//
//  ListProtocols.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

protocol ListInteractorProtocol: class {
    func fetchGitHubRepos(page: UInt8, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void)
}

protocol ListRouterProtocol: class {
    func showDetailViewForRepo(_ repoModel: GitHubRepoModel)
}

protocol ListPresenterProtocol: class {
    func viewDidLoad()
    func didSelectRowAtIndex(_ index: Int)
    func willDisplayRowSAtIndex(_ index: Int)
    func pullToRefreshDidTrigger()
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
