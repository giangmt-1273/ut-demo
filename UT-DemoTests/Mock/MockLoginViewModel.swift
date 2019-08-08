//
//  MockLoginViewModel.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest

class MockLoginViewModel: LoginViewModel {

    var performInitialViewSetupExpectation:XCTestExpectation?
    var emailDidEndOnExitExpectation:XCTestExpectation?
    var passwordDidEndOnExitExpectation:XCTestExpectation?
    var emailUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var passwordUpdatedExpectation:(XCTestExpectation, expectedValue:String)?
    var loginExpectation:(XCTestExpectation, expectedUserName:String, expectedPassword:String)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func emailDidEndOnExit() {
        emailDidEndOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidEndOnExitExpectation?.fulfill()
    }
    
    override func emailTextFieldUpdated(_ value: String?) {
        if let (expectation, expectedValue) = self.emailUpdatedExpectation,
            let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func passwordTextFieldUpdated(_ value: String?) {
        if let (expectation, expectedValue) = self.passwordUpdatedExpectation,
            let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func login(email: String?, password: String?) {
        if let (expectation, expectedEmail, expectedPassword) = self.loginExpectation,
            let email = email,
            let password = password {
            if (email.compare(expectedEmail) == .orderedSame)
                && (password.compare(expectedPassword) == .orderedSame) {
                expectation.fulfill()
            }
        }
    }
}
