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

    var githubRepos:[GitHubRepoCellModel] = [
        GitHubRepoCellModel(name: "amazing iOS 1", fullName: "asdrt/amazingiOS 1"),
        GitHubRepoCellModel(name: "amazing iOS 2", fullName: "asdrt/amazingiOS 2"),
        GitHubRepoCellModel(name: "amazing iOS 3", fullName: "asdrt/amazingiOS 3"),
        GitHubRepoCellModel(name: "amazing iOS 4", fullName: "asdrt/amazingiOS 4"),
        GitHubRepoCellModel(name: "amazing iOS 5", fullName: "asdrt/amazingiOS 5")
    ]
    //    {
    //        didSet {
    //            tableView.reloadData()
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
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

extension ListViewController: ListViewProtocol {

}
