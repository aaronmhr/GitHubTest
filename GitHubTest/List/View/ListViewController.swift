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
    @IBOutlet private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    var githubRepos:[GitHubRepoCellModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    lazy var fullScreenView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .black
        view.alpha = 0.3
        return view
    }()
    
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
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        presenter.viewDidLoad()
    }
    
    @objc private func refreshData() {
        presenter.refreshTable()
        refreshControl.endRefreshing()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ListViewController: ListViewProtocol {
    func addFullScreenLoadingView() {
        DispatchQueue.main.async {
            self.tableView.isUserInteractionEnabled = false
            self.navigationController?.navigationBar.addSubview(self.fullScreenView)
        }
    }
    
    func removeFullScreenLoadingView() {
        DispatchQueue.main.async {
            self.tableView.isUserInteractionEnabled = true
            self.fullScreenView.removeFromSuperview()
        }
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
        guard let lastRowIndex = githubRepos.indices.last else { return }
        if indexPath.row == lastRowIndex {
            presenter.loadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAtIndex(indexPath.row)
    }
}
