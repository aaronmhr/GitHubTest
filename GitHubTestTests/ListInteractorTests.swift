//
//  ListInteractorTests.swift
//  GitHubTestTests
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

@testable import GitHubTest
import XCTest

class ListInteractorTests: XCTestCase {
    
    private var sut1: ListInteractor!
    private var sut2: ListInteractor!

    override func setUp() {
        sut1 = ListInteractor(dependencies: MockInteractorDependenciesFailure())
        sut2 = ListInteractor(dependencies: MockInteractorDependenciesSuccess())
    }

    override func tearDown() {
        sut1 = nil
        sut2 = nil
    }

    func testFail() {
        sut1.fetchGitHubRepos(page: 1) { response in
            switch response {
            case .failure(let error):
                XCTAssertEqual(error, APIServiceError.invalidEndpoint)
            case .success:
                XCTFail()
            }
        }
    }
    
    func testSuccess() {
        sut2.fetchGitHubRepos(page: 1) { response in
            switch response {
            case .failure:
                XCTFail()
            case .success(let repo):
                XCTAssertEqual(repo, [TestingObjects.repo1])
            }
        }
    }
}

class DetailInteractorTests: XCTestCase {
    
    private var sut1: DetailInteractorProtocol!
    private var sut2: DetailInteractorProtocol!
    
    override func setUp() {
        sut1 = DetailInteractor(repoModel: TestingObjects.repo1, dependencies: MockInteractorDependenciesFailure())
        sut2 = DetailInteractor(repoModel: TestingObjects.repo1, dependencies: MockInteractorDependenciesSuccess())
    }
    
    override func tearDown() {
        sut1 = nil
        sut2 = nil
    }
    
    func testFail() {
        sut1.fetchContributorsList(url: nil) { response in
            switch response {
            case .failure(let error):
                XCTAssertEqual(error, APIServiceError.invalidEndpoint)
            case .success:
                XCTFail()
            }
        }
    }
    
    func testSuccess() {
        guard let url = URL(string: sut2.repoModel.contributorsURL) else {
            XCTFail()
            return
        }
        sut2.fetchContributorsList(url: url) { response in
            switch response {
            case .failure:
                XCTFail()
            case .success(let contributor):
                XCTAssertEqual(contributor, [TestingObjects.contributor])
            }
        }
    }
}


final class MockInteractorDependenciesFailure: ListInteractorDependenciesProtocol, DetailInteractorDependenciesProtocol {
    lazy var repository: GitHubRepositoryProtocol = MockRepository()
    
    final class MockRepository: GitHubRepositoryProtocol {
        func retrieveReposList(url: URL, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void) {
            completion(.failure(.invalidEndpoint))
        }
        
        func retrieveContributorsList(url: URL, completion: @escaping (Result<[Contributor], APIServiceError>) -> Void) {
            completion(.failure(.invalidEndpoint))
        }
    }
}

final class MockInteractorDependenciesSuccess: ListInteractorDependenciesProtocol, DetailInteractorDependenciesProtocol {
    lazy var repository: GitHubRepositoryProtocol = MockRepository()
    
    final class MockRepository: GitHubRepositoryProtocol {
        func retrieveReposList(url: URL, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void) {
            completion(.success([TestingObjects.repo1]))
        }
        
        func retrieveContributorsList(url: URL, completion: @escaping (Result<[Contributor], APIServiceError>) -> Void) {
            completion(.success([TestingObjects.contributor]))
        }
    }
}
