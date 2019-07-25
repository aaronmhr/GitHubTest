//
//  DetailContributorCell.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailContributorCell: UITableViewCell, NibReusable {
    @IBOutlet private var contributorImage: UIImageView!
    @IBOutlet private var contributorName: UILabel!
    
    var contributor: Contributor? {
        didSet {
            guard let model = contributor else { return }
            contributorName.text = model.name
            contributorImage.downloadImageFromURLString(model.imageStringURL)
        }
    }
}
