//
//  DetailViewViewModel.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import Foundation

struct DetailViewViewModel {
    let header: DetailHeaderViewModel
    let contributors: [Contributor]
}

struct DetailHeaderViewModel {
    let title: String
    let fullName: String
    let size: String
    let stargazersCount: String
    let forksCount: String
}



