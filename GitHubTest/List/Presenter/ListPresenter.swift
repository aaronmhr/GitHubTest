//
//  ListPresenter.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListPresenter {
    private enum Constants {
        static let navBarTitle = "Swift Repositories"
    }
    let router: ListRouterProtocol
    let interactor: ListInteractorProtocol
    weak var view: ListViewProtocol!
    
    private var page: UInt8 = 1
    private var rows: [GitHubRepoModel] = [] {
        didSet {
            view.githubRepos = rows.map { GitHubRepoCellModel(name: $0.name, fullName: $0.fullName) }
        }
    }

    init(withView view: ListViewProtocol, interactor: ListInteractorProtocol, router: ListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: ListPresenterProtocol {
    func viewDidLoad() {
        view.navigationBarTitle = Constants.navBarTitle
        loadData()
    }
    
    func didSelectRowAtIndex(_ index: Int) {
        guard rows.indices.contains(index) else { return }
        router.showDetailViewForRepo(rows[index])
    }
    
    func loadData() {
        view.addFullScreenLoadingView()
        let url = interactor.urlStringForRepos(page: page)
        interactor.fetchGitHubRepos(url: url) { [weak self] response in
            self?.view.removeFullScreenLoadingView()
            switch response {
            case .success(let repos):
                self?.rows += repos
                self?.page += 1
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func refreshTable() {
        rows = []
        page = 1
        loadData()
    }
}
