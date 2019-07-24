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
        view.githubRepos = [
            GitHubRepoCellModel(name: "amazing iOS 1", fullName: "asdrt/amazingiOS 1"),
            GitHubRepoCellModel(name: "amazing iOS 2", fullName: "asdrt/amazingiOS 2"),
            GitHubRepoCellModel(name: "amazing iOS 3", fullName: "asdrt/amazingiOS 3"),
            GitHubRepoCellModel(name: "amazing iOS 4", fullName: "asdrt/amazingiOS 4"),
            GitHubRepoCellModel(name: "amazing iOS 5", fullName: "asdrt/amazingiOS 5")
        ]
    }
    
    func didSelectRowAtIndex(_ index: Int) {
        
    }
    
    func shouldLoadMoreRows() {
        
    }
}
