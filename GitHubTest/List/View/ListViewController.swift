//
//  ListViewController.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    var presenter: ListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListViewController: ListViewProtocol {

}