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
    //[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}
    fileprivate let emptyString = ""
    fileprivate let validEmailAddress1 = "email@example.com"
    fileprivate let validEmailAddress2 = "very.common@example.com"
    fileprivate let validEmailAddress3 = "disposable.style.email.with+symbol@example.com"
    fileprivate let validEmailAddress4 = "other.email-with-hyphen@example.com"
    fileprivate let validEmailAddress5 = "fully-qualified-domain@example.com"
    fileprivate let validEmailAddress6 = "user.name+tag+sorting@example.com"
    fileprivate let validEmailAddress7 = "user.name@example.com"
    fileprivate let validEmailAddress8 = "x@example.com"
    fileprivate let validEmailAddress9 = "example-indeed@strange-example.com"
    fileprivate let validEmailAddress10 = "admin@mail.se"
    fileprivate let validEmailAddress11 = "Admin@mail.com"
    fileprivate let validEmailAddress12 = "Admin123%+10@mail.com"
    fileprivate let validEmailAddress13 = "-@mail.com"
    fileprivate let validEmailAddress14 = "1%@mail.com"

    fileprivate let invalidEmailAddress1 = "plainaddress"
    fileprivate let invalidEmailAddress2 = "#@%^%#$@#$@#.com"
    fileprivate let invalidEmailAddress3 = "@example.com"
    fileprivate let invalidEmailAddress4 = "Joe Smith <email@example.com>"
    fileprivate let invalidEmailAddress5 = "email.example.com"
    fileprivate let invalidEmailAddress6 = "email@example@example.com"
    fileprivate let invalidEmailAddress10 = "あいうえお@example.com"
    fileprivate let invalidEmailAddress11 = "email@example.com (Joe Smith)"
    fileprivate let invalidEmailAddress12 = "email@example"
    fileprivate let invalidEmailAddress15 = "email@111.222.333.44444"
    
    fileprivate let validPassword1 = "12345678"
    fileprivate let validPassword2 = "12345678888888888"
    fileprivate let invalidPassword1 = "1"

    override func setUp() {
        super.setUp()
        self.viewModel = LoginViewModel()
    }

    override func tearDown() {
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
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress1) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress2_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress2
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress2) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress3_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress3
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress3) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress4_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress4
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress4) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress5_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress5
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress5) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress6_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress6
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress6) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress10_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress10
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress10) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress11_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress11
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress11) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress12_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress12
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress12) is valid.")
    }
    
    func testValidateEmail_InvalidEmailAddress15_ReturnsFalse() {
        viewModel.email.value = invalidEmailAddress15
        XCTAssertFalse(viewModel.validateEmail(), "\(invalidEmailAddress15) is valid.")
    }
}


// MARK: valid email-addresses
extension LoginViewModelTests {
    func testValidateEmail_ValidEmailAddress1_ReturnsTrue() {
        viewModel.email.value = validEmailAddress1
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress1) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress2_ReturnsTrue() {
        viewModel.email.value = validEmailAddress2
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress2) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress3_ReturnsTrue() {
        viewModel.email.value = validEmailAddress3
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress3) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress4_ReturnsTrue() {
        viewModel.email.value = validEmailAddress4
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress4) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress5_ReturnsTrue() {
        viewModel.email.value = validEmailAddress5
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress5) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress6_ReturnsTrue() {
        viewModel.email.value = validEmailAddress6
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress6) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress7_ReturnsTrue() {
        viewModel.email.value = validEmailAddress7
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress7) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress8_ReturnsTrue() {
        viewModel.email.value = validEmailAddress8
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress8) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress9_ReturnsTrue() {
        viewModel.email.value = validEmailAddress9
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress9) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress10_ReturnsTrue() {
        viewModel.email.value = validEmailAddress10
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress10) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress11_ReturnsTrue() {
        viewModel.email.value = validEmailAddress11
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress11) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress12_ReturnsTrue() {
        viewModel.email.value = validEmailAddress12
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress12) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress13_ReturnsTrue() {
        viewModel.email.value = validEmailAddress13
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress13) is invalid.")
    }
    
    func testValidateEmail_ValidEmailAddress14_ReturnsTrue() {
        viewModel.email.value = validEmailAddress14
        XCTAssertTrue(viewModel.validateEmail(), "\(validEmailAddress14) is invalid.")
    }
}

// MARK: invalid password
extension LoginViewModelTests {
    func testValidatePassword_InvalidPassword_ReturnsFalse() {
        viewModel.password.value = invalidPassword1
        XCTAssertFalse(viewModel.validatePassword(), "\(invalidPassword1) is valid.")
    }
}

// MARK: valid password
extension LoginViewModelTests {
    func testValidatePassword_ValidPassword1_ReturnsTrue() {
        viewModel.password.value = validPassword1
        XCTAssertTrue(viewModel.validatePassword(), "\(validPassword1) is invalid.")
    }

    func testValidatePassword_ValidPassword2_ReturnsTrue() {
        viewModel.password.value = validPassword2
        XCTAssertTrue(viewModel.validatePassword(), "\(validPassword2) is invalid.")
    }
}
