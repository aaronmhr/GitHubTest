//
//  DetailViewController.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol!
    @IBOutlet private var tableView: UITableView!
    var viewModel: DetailViewViewModel? {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.navigationBar.prefersLargeTitles = false
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: DetailHeaderCell.self)
        tableView.register(cellType: DetailContributorCell.self)
    }
}

extension DetailViewController: DetailViewProtocol {
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

//MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerViewModel = viewModel?.header else { return nil }
        let header: DetailHeaderCell = tableView.dequeueReusableCell()
        header.setupHeader(headerViewModel)
        header.backgroundColor = .white
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

//MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.contributors.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contributors = viewModel?.contributors else { return UITableViewCell() }
        let cell: DetailContributorCell = tableView.dequeueReusableCell(for: indexPath)
        cell.contributor = contributors[indexPath.row]
        return cell
    }
}
