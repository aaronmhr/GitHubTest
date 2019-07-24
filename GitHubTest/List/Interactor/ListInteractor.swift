//
//  ListInteractor.swift
//  GitHubTest
//
//  Created by Aaron Huánuco on 24/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

protocol ListInteractorDependenciesProtocol {
}

final class ListInteractorDependencies: ListInteractorDependenciesProtocol {
}

final class ListInteractor {
    let dependencies: ListInteractorDependenciesProtocol

    init(dependencies: ListInteractorDependenciesProtocol = ListInteractorDependencies()) {
        self.dependencies = dependencies
    }
}

extension ListInteractor: ListInteractorProtocol {

}
