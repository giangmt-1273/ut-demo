//
//  LoginViewControllerTest.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest

class LoginViewControllerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        let expectation = self.expectation(description: "expected performInitialViewSetup() to be called")
        let loginViewController = LoginViewController()
        let viewModel = MockLoginViewModel(view: loginViewController)
        
        viewModel.performInitialViewSetupExpectation = expectation
        loginViewController.viewModel = viewModel
        loginViewController.viewDidLoad()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
}
