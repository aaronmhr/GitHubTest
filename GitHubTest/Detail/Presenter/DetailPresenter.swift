//
//  DetailPresenter.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailPresenter {
    private enum Constants {
        static let repoName = "Name: %@"
        static let repoSize = "Size: %@kB"
        static let repoStargazers = "Stargazers: %@"
        static let repoForks = "Forks: %@"
    }
    let router: DetailRouterProtocol
    let interactor: DetailInteractorProtocol
    weak var view: DetailViewProtocol!

    init(withView view: DetailViewProtocol, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoad() {
        let selectedRepo = interactor.repoModel
        let header = DetailHeaderViewModel(
            title: selectedRepo.name.uppercased(),
            fullName: String(format: Constants.repoName, selectedRepo.fullName),
            size: String(format: Constants.repoSize, "\(selectedRepo.size)"),
            stargazersCount: String(format: Constants.repoStargazers, "\(selectedRepo.stargazersCount)"),
            forksCount: String(format: Constants.repoForks, "\(selectedRepo.forksCount)"))
        interactor.fetchContributorsList(url: URL(string:selectedRepo.contributorsURL)) { [weak self] response in
            switch response {
            case .success(let contributors):
                let viewModel = DetailViewViewModel(header: header, contributors: contributors)
                self?.view.viewModel = viewModel
            case .failure(let error):
                print(error)
                let viewModel = DetailViewViewModel(header: header, contributors: [])
                self?.view.viewModel = viewModel
            }
        }
    }
}
