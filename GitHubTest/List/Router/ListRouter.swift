//
//  ListRouter.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListRouter {
    private enum COnstants {
        static let storyboard = "List"
        static let viewControllerID = String(describing: ListViewController.self)
    }
    weak var view: ListViewController!

    init(withView view: ListViewController) {
        self.view = view
    }

    static func assembleModule() -> UIViewController {
        let viewController = defaultViewController
        let router = ListRouter(withView: viewController)

        let interactor = ListInteractor()
        let presenter = ListPresenter(withView: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }

    static var defaultViewController: ListViewController {
        let storyaboard = UIStoryboard(name: COnstants.storyboard, bundle: nil)
        guard let viewController = storyaboard.instantiateViewController(withIdentifier: COnstants.viewControllerID) as? ListViewController else {
            fatalError("Failed to instantiate \(COnstants.viewControllerID)")
        }
        return viewController
    }
}

extension ListRouter: ListRouterProtocol {

}
