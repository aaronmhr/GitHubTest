//
//  EndpointsTests.swift
//  GitHubTestTests
//
//  Created by Aaron Huánuco on 25/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

import XCTest
@testable import GitHubTest

class EndpointsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepoEndpoints() {
        // Given
        let sut: Endpoints = Endpoints.repos
        let queryItems = [
            URLQueryItem(name: "q", value: "language:swift"),
            URLQueryItem(name: "per_page", value: "25"),
            URLQueryItem(name: "page", value: "\(1)")
        ]
        let expectedUrl = "https://api.github.com/search/repositories?q=language:swift&per_page=25&page=1"
        // When
        let urlString = sut.endpointUrl(with: queryItems)?.absoluteString
        
        // Then
        XCTAssertEqual(expectedUrl, urlString, "Endpoing URL should contain query items")
    }
}
