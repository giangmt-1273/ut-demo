//
//  MockLoginViewController.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest

class MockLoginViewController: LoginViewControllerProtocol {
    var expectationForClearEmailField:XCTestExpectation?
    var expectationForClearPasswordField:XCTestExpectation?
    var expectationForEnableLoginButton:(XCTestExpectation, Bool)?
    var expectationForHideKeyboard:XCTestExpectation?
    
    func clearEmailField() {
        self.expectationForClearEmailField?.fulfill()
    }
    
    func clearPasswordField() {
        self.expectationForClearPasswordField?.fulfill()
    }
    
    func enableLoginButton(_ status: Bool) {
        if let (expectation, expectedValue) = self.expectationForEnableLoginButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func hideKeyboard() {
        self.expectationForHideKeyboard?.fulfill()
    }
}
