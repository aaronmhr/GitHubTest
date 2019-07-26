//
//  URLSessionTests.swift
//  GitHubTestTests
//
//  Created by Aaron Huánuco on 26/07/2019.
//  Copyright © 2019 Aaron Huánuco. All rights reserved.
//

@testable import GitHubTest
import XCTest


class URLSessionTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testNonValidURL() {
        let imageView = UIImageView(frame: .zero)
        let expectation = self.expectation(description: "Getting Images")
        
        imageView.downloadImageFromURLString("Non valid URL") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertNil(imageView.image)
    }
    
    func testValidURL() {
        let imageView = UIImageView(frame: .zero)
        let expectation = self.expectation(description: "Getting Images")
        imageView.downloadImageFromURLString("https://files.betamax.raywenderlich.com/attachments/videos/2909/c676a0d1-a936-45a2-99bf-cd258b061727.png") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 7, handler: nil)
        XCTAssertNotNil(imageView.image)
    }
}
