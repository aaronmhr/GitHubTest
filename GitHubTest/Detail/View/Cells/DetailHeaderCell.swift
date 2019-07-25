//
//  DetailHeaderCell.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailHeaderCell: UITableViewHeaderFooterView, NibReusable {
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var sizeLabel: UILabel!
    @IBOutlet private var stargazers: UILabel!
    @IBOutlet private var forks: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        containerView.layer.cornerRadius = 15.0
        titleLabel.textColor = .white
        fullNameLabel.textColor = .white
        sizeLabel.textColor = .white
        stargazers.textColor = .white
        forks.textColor = .white
    }
    
    func setupHeader(_ header: DetailHeaderViewModel) {
        titleLabel.text = header.title
        fullNameLabel.text = header.fullName
        sizeLabel.text = header.size
        stargazers.text = header.stargazersCount
        forks.text = header.forksCount
    }
}
