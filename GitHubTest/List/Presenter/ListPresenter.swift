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

    init(withView view: ListViewProtocol, interactor: ListInteractorProtocol, router: ListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: ListPresenterProtocol {
    func viewDidLoad() {
        view.navigationBarTitle = Constants.navBarTitle
        interactor.fetchGitHubRepos { [weak self] response in
            switch response {
            case .success(let repos):
                self?.view.githubRepos = repos.map { GitHubRepoCellModel(name: $0.name, fullName: $0.fullName) }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func didSelectRowAtIndex(_ index: Int) {
        
    }
    
    func shouldLoadMoreRows() {
        
    }
}
