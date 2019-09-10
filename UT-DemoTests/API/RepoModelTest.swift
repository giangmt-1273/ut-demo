//
//  RepoTest.swift
//  UT-DemoTests
//
//  Created by le.huu.dung on 8/27/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest
@testable import UT_Demo

class RepoTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Testing the JSON parser
    
    func test_RepoViewModel_dataRepo_returnAmountDataRepo() {
        let repoData = loadStub(name: "repo", extension: "json")
        let repoArray = Repo.fromDatas(jsonObject: repoData)
        XCTAssertEqual(repoArray.count, 10)
    }

}
