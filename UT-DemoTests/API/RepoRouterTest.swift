//
//  RepoRouterTest.swift
//  UT-DemoTests
//
//  Created by le.huu.dung on 8/23/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest
@testable import UT_Demo
@testable import Alamofire

class RepoRouterTest: XCTestCase {
    
    private var validateHostUrl  = "api.github.com"
       private let validateUrl = "https://api.github.com/search/repositories?page=1&per_page=10&q=language%3Aswift"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_RepoViewModel_checkExpectedUrl() {
        var params = Parameters()
        params["q"] = "language:swift"
        params["page"] = 1
        params["per_page"] = 10
        let urlComponent = RepoRouter.getRepos(parameters: params)
        if let urlRequest = try? urlComponent.asURLRequest()
            .url {
            XCTAssertEqual(urlRequest?.absoluteString, self.validateUrl)
        }
    }
}
