//
//  ListPresenterTests.swift
//  GitHubTestTests
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

@testable import GitHubTest
import XCTest

class ListPresenterTests: XCTestCase {
    private var sut: ListPresenter!
    private let view = MockListView()
    private let interactor = MockListInteractor()
    private let router = MockListRouter()

    override func setUp() {
        sut = ListPresenter(withView: view, interactor: interactor, router: router)
        view.presenter = sut
    }

    override func tearDown() {
        sut = nil
    }

    func testViewDidLoadRetrievesData() {
        interactor.fetchRepoShouldFail = false
        XCTAssertTrue(sut.rows.isEmpty, "Repos array should be empty at the beginning")
        sut.viewDidLoad()
        XCTAssertFalse(sut.rows.isEmpty, "viewDidLoad retrieves data")
        let rowsRetrievedByViewDidLoad = sut.rows.count
        sut.viewDidLoad()
        XCTAssertEqual(rowsRetrievedByViewDidLoad, sut.rows.count, "viewDidLoad is called only once")
    }
    
    func testViewDidLoadRetrievesDataError() {
        interactor.fetchRepoShouldFail = true
        XCTAssertTrue(sut.rows.isEmpty, "Repos array should be empty at the beginning")
        sut.viewDidLoad()
        XCTAssertTrue(sut.rows.isEmpty, "viewDidLoad doesn't retrieve date if an error occurs")
    }
    
    func testDidSelectRowAtIndexOnlyAcceptsZeroAndPositiveIntegers() {
        sut.viewDidLoad()
        sut.didSelectRowAtIndex(-2)
        XCTAssertNil(router.selectedRepoModel, "Indices must be positive")
        sut.didSelectRowAtIndex(2)
        XCTAssertNil(router.selectedRepoModel, "Cannot accept index out of range")
        sut.didSelectRowAtIndex(0)
        XCTAssertNotNil(router.selectedRepoModel, "Zero is a valid index")
    }
    
    func testWillDisplayRowsAtIndexShouldLoadmoreDataTriggeredByTheLastElement() {
        sut.viewDidLoad()
        let firstCount = sut.rows.count
        sut.willDisplayRowSAtIndex(-2)
        let secondCount = sut.rows.count
        XCTAssertEqual(secondCount, firstCount, "Out of range indices don't affect the data")
        sut.willDisplayRowSAtIndex(2)
        let thirdCount = sut.rows.count
        XCTAssertEqual(thirdCount, secondCount, "Out of range indices don't affect the data")
        sut.willDisplayRowSAtIndex(0)
        let fourthCount = sut.rows.count
        XCTAssertEqual(fourthCount, thirdCount, "Only last index of rows affect data")
        sut.willDisplayRowSAtIndex(1)
        let fifthCount = sut.rows.count
        XCTAssertGreaterThan(fifthCount, fourthCount, "Last index of rows affect data")
        sut.willDisplayRowSAtIndex(2)
        let sixthCount = sut.rows.count
        XCTAssertEqual(sixthCount, fifthCount, "Only last index of rows affect data")
        sut.willDisplayRowSAtIndex(3)
        let seventhCount = sut.rows.count
        XCTAssertGreaterThan(seventhCount, sixthCount, "Last index of rows affect data")
    }
    
    func testPullToRefreshDidTrigger() {
        sut.viewDidLoad()
        let firstRetrievedData = sut.rows.count
        sut.willDisplayRowSAtIndex(1)
        let secondRetrievedData = sut.rows.count
        XCTAssertGreaterThan(secondRetrievedData, firstRetrievedData, "Last index of rows affect data")
        sut.pullToRefreshDidTrigger()
        XCTAssertNotEqual(sut.rows.count, secondRetrievedData)
        XCTAssertEqual(sut.rows.count, firstRetrievedData)
        
    }
}


// MARK: - Mock View
final class MockListView: ListViewProtocol {
    var presenter: ListPresenterProtocol!
    var navigationBarTitle: String?
    var githubRepos: [GitHubRepoCellModel] = []
    var fullScreenView = UIView()
    
    func addFullScreenLoadingView() { }
    func removeFullScreenLoadingView() { }
}

// MARK: - Mock Interactor

final class MockListInteractor: ListInteractorProtocol {
    var fetchRepoShouldFail = false
    private var repos: [GitHubRepoModel] = [TestingObjects.repo1, TestingObjects.repo2]
    private var error: APIServiceError = .invalidEndpoint
    
    func fetchGitHubRepos(page: UInt8, completion: @escaping (Result<[GitHubRepoModel], APIServiceError>) -> Void) {
        switch fetchRepoShouldFail {
        case true:
            completion(.failure(.invalidEndpoint))
        case false:
            completion(.success(repos))
        }
    }
}

// MARK: - Mock Router


final class MockListRouter: ListRouterProtocol {
    private (set) var selectedRepoModel: GitHubRepoModel?
    
    func showDetailViewForRepo(_ repoModel: GitHubRepoModel) {
        self.selectedRepoModel = repoModel
    }
}
