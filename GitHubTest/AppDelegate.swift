//
//  AppDelegate.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = ListRouter.assembleModule()
        let navigationController = UINavigationController(rootViewController: viewController)
        setRootViewController(navigationController)
        return true
    }
}

extension AppDelegate {
    private func setRootViewController(_ viewController: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = viewController
    }
}
