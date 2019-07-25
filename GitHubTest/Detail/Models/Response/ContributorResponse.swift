//
//  ContributorResponse.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//


struct ContributorResponse: Codable {
    let login: String?
    let avatarUrl: String?
}

extension ContributorResponse {
    var asContributor: Contributor? {
        guard let name = self.login else {
                return nil
        }
        return Contributor(name: name, imageStringURL: self.avatarUrl ?? "")
    }
}
