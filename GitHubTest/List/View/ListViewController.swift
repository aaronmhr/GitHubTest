//
//  ListViewController.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController, ListViewProtocol {
    var presenter: ListPresenterProtocol!
    @IBOutlet private var tableView: UITableView!

    var githubRepos:[GitHubRepoCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var navigationBarTitle: String? {
        didSet {
            title = navigationBarTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        presenter.viewDidLoad()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let cellData = githubRepos[indexPath.row]
        cell.textLabel?.text = cellData.name
        cell.detailTextLabel?.text = cellData.fullName
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
