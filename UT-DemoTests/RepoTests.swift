//
//  RepoTests.swift
//  UT-DemoTests
//
//  Created by maithigiang on 8/9/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest
@testable import UT_Demo

class RepoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepo_ValidJson_CanBeInstantiated() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "validJson", withExtension: "json"),
            let data = try? Data(contentsOf: url, options: .mappedIfSafe) else {
            XCTFail("Missing file: validJson.json")
            return
        }
        let repo = Repo(jsonObject: data)
        XCTAssertNotNil(repo?.id)
    }
    
    func testParserJson() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "validJson", withExtension: "json"),
            let data = try? Data(contentsOf: url, options: .mappedIfSafe) else {
            XCTFail("Missing file: validJson.json")
            return
        }
        let repo = Repo(jsonObject: data)
        XCTAssertEqual(repo!.fullname, "vsouza/awesome-ios")
        XCTAssertEqual(repo!.id, 21700699)
    }
    
    func testPaserFromAny_Valid_Object() {
        var dic: [String: Any] = [:]
        dic["id"] = 1
        dic["full_name"] = "maigiang08"
        let repo = Repo(jsonObject: dic)
        XCTAssertEqual(repo!.fullname, "maigiang08")
        XCTAssertEqual(repo!.id, 1)
    }
    
    func testPaserArrayJson_returnAmountDataRepo() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "validArrayRepo", withExtension: "json"),
            let data = try? Data(contentsOf: url, options: .mappedIfSafe) else {
                XCTFail("Missing file: validArrayRepo.json")
                return
        }
        let repoArray = Repo.fromDatas(jsonObject: data)
        XCTAssertEqual(repoArray.count, 10)
    }
}
