//
//  MockLoginController.swift
//  UT-Demo
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation
import XCTest


class MockLoginController: LoginController {
    private var expectation: XCTestExpectation?
    private var expectedEmail: String?
    private var expectedPassword: String?
    var shouldReturnTrueOnLogin: Bool
    
    init(_ expectation:XCTestExpectation, expectedEmail:String, expectedPassword:String) {
        self.expectation = expectation
        self.expectedEmail = expectedEmail
        self.expectedPassword = expectedPassword
        self.shouldReturnTrueOnLogin = false
        super.init(delegate:nil)
    }
    
    override func doLogin(model: LoginModel) {
        if let expectation = self.expectation,
            let expectedEmailAddr = self.expectedEmail,
            let expectedPassword = expectedPassword {
            if model.emailAddress.compare(expectedEmailAddr) == .orderedSame
                && model.password.compare(expectedPassword) == .orderedSame {
                expectation.fulfill()
            }
        }
        loginControllerDelegate?.loginResult(result:shouldReturnTrueOnLogin)
    }
}
