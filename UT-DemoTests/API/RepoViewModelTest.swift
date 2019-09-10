//
//  RepoViewModelTest.swift
//  UT-DemoTests
//
//  Created by le.huu.dung on 8/20/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest
@testable import UT_Demo
@testable import Alamofire
@testable import SwiftyJSON
@testable import Mockingjay

class RepoViewModelTest: XCTestCase {
    private let validateUrl = "https://api.github.com/search/repositories?page=1&per_page=10&q=language%3Aswift"
    var repoViewModel: RepoViewModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repoViewModel = RepoViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repoViewModel = nil
    }
    
    
    // Mocking Network Requests With Mockingjay
    
    //1
    func test_RepoViewModel_getDataSuccess_withNumberRepoGreaterThanZero() {
        
       let body = loadStub(name: "repo", extension: "json")
       stub(uri(validateUrl), jsonData(body))
        
        let expectation = self.expectation(description: "Expectation is to get data")
        repoViewModel?.getRepos {response in
            XCTAssertEqual(response?.result, RequestResult.success)
            let repoArr = self.repoViewModel?.repos.value
            guard let repoArray = repoArr,
                let firstRepos = repoArray.first else {
                XCTFail("repos equal  nil")
                return
            }
            XCTAssertEqual(firstRepos?.id, 21700699)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    //2
    func test_RepoViewModel_ItemsJsonEmpty_numberRepoEqualZero() {

       let body = loadStub(name: "repoEmpty", extension: "json")
       stub(uri(validateUrl), jsonData(body))

        let expectation = self.expectation(description: "Expectation is number Items Returned 0")
        repoViewModel?.getRepos {response in
            XCTAssertEqual(response?.result, RequestResult.success)
            XCTAssertEqual(self.repoViewModel?.repos.value.count, 0)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    // 3
    func test_RepoViewModel_JsonIsNotCorrectFormat_numberRepoEqualZero() {

        let body = [ "item": "body" ]
        stub(uri(validateUrl), json(body))
        
        let expectation = self.expectation(description: "Expectation is number Items Returned 0")
        repoViewModel?.getRepos {response in
            XCTAssertEqual(response?.result, RequestResult.success)
            XCTAssertEqual(self.repoViewModel?.repos.value.count, 0)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    // 4
    func test_RepoViewModel_ErrorValidationFail_showDataDefault() {
        stub(uri(validateUrl), http(HttpStatusCode.validationFail.rawValue))
        
        let expectation = self.expectation(description: "Expectation show Data default")
        repoViewModel?.getRepos {_ in
            XCTAssertEqual(self.repoViewModel?
            .repos.value.count, 1)
            let reposArr = self.repoViewModel?
                .repos.value
            XCTAssertNotNil(reposArr)
            guard let repos = reposArr,
                let firstRepos = repos.first else {
                XCTFail("repos equal  nil")
                return
            }
            XCTAssertEqual(firstRepos?.id, 1)
            XCTAssertEqual(firstRepos?.fullname, "lala")
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    //5
    func test_RepoViewModel_error404_return404() {
        stub(uri(validateUrl), http(HttpStatusCode.notFound.rawValue))
        
        let expectation = self.expectation(description: "Expectation return status code 404")
        repoViewModel?.getRepos {_ in
            
            XCTAssertEqual(self.repoViewModel?.error.value?.statusCode?.rawValue, 404)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
}

