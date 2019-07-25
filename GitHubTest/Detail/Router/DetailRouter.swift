//
//  DetailRouter.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailRouter {
    private enum Constants {
        static let storyboard = "Detail"
        static let viewControllerID = String(describing: DetailViewController.self)
    }
    weak var view: DetailViewController!

    init(withView view: DetailViewController) {
        self.view = view
    }

    static func assembleModule(repoModel: GitHubRepoModel) -> UIViewController {
        let viewController = defaultViewController
        let router = DetailRouter(withView: viewController)

        let interactor = DetailInteractor(repoModel: repoModel)
        let presenter = DetailPresenter(withView: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }

    static var defaultViewController: DetailViewController {
        let storyaboard = UIStoryboard(name: Constants.storyboard, bundle: nil)
        guard let viewController = storyaboard.instantiateViewController(withIdentifier: Constants.viewControllerID) as? DetailViewController else {
            fatalError("Failed to instantiate \(Constants.viewControllerID)")
        }
        return viewController
    }
}

extension DetailRouter: DetailRouterProtocol {

}
