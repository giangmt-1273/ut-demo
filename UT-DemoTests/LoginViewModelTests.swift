//
//  LoginViewModelTests.swift
//  UT-DemoTests
//
//  Created by maithigiang on 8/18/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest
@testable import UT_Demo

class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    
    fileprivate let emptyString = ""
    fileprivate let validEmailAddress1 = "a@b.com"
    fileprivate let validEmailAddress2 = "A@b.com"
    fileprivate let validEmailAddress3 = "0@b.com"

    fileprivate let invalidEmailAddress1 = "ab.com"
    fileprivate let invalidEmailAddress2 = "abcom"
    fileprivate let invalidEmailAddress3 = "a@b@com"
    
    fileprivate let validPassword1 = "12345678"
    fileprivate let validPassword2 = "12345678888888888"
    fileprivate let invalidPassword1 = "1"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.viewModel = LoginViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewModel = nil
        super.tearDown()
    }
}

// MARK: Empty string validation
extension LoginViewModelTests {
    func testValidateEmail_EmptyString_ReturnsFalse() {
        viewModel.email.value = emptyString
        XCTAssertFalse(viewModel.validateEmail(), "string can not be empty.")
    }
    
    func testValidatePassword_EmptyString_ReturnsFalse() {
        viewModel.password.value = emptyString
        XCTAssertFalse(viewModel.validatePassword(), "string can not be empty.")
    }
}

// MARK: invalid email-addresses
extension LoginViewModelTests {
    func testValidateEmail_InvalidEmailAddress1_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress1
        XCTAssertFalse(viewModel.validateEmail(), "email 1 is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress2_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress2
        XCTAssertFalse(viewModel.validateEmail(), "email 2 is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress3_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress3
        XCTAssertFalse(viewModel.validateEmail(), "email 3 is valid.")
    }
}


// MARK: valid email-addresses
extension LoginViewModelTests {
    func testValidateEmail_ValidEmailAddress1_ReturnsTrue() {
        viewModel.email.value = validEmailAddress1
        XCTAssertTrue(viewModel.validateEmail(), "email 1 is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress2_ReturnsTrue() {
        viewModel.email.value = validEmailAddress2
        XCTAssertTrue(viewModel.validateEmail(), "email 2 is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress3_ReturnsTrue() {
        viewModel.email.value = validEmailAddress3
        XCTAssertTrue(viewModel.validateEmail(), "email 3 is invalid.")
    }
}

// MARK: invalid password
extension LoginViewModelTests {
    func testValidatePassword_InvalidPassword_ReturnsFalse() {
        viewModel.password.value = invalidPassword1
        XCTAssertFalse(viewModel.validatePassword(), "password 1 is valid.")
    }
}

// MARK: valid password
extension LoginViewModelTests {
    func testValidatePassword_ValidPassword1_ReturnsTrue() {
        viewModel.password.value = validPassword1
        XCTAssertTrue(viewModel.validatePassword(), "password 1 is invalid.")
    }

    func testValidatePassword_ValidPassword2_ReturnsTrue() {
        viewModel.password.value = validPassword2
        XCTAssertTrue(viewModel.validatePassword(), "password 2 is invalid.")
    }
}
