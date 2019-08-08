//
//  LoginViewModelTest.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest

class LoginViewModelTest: XCTestCase {

    fileprivate var mockLoginViewController:MockLoginViewController?
    fileprivate var validEmail = "abc@gmail.com"
    fileprivate var invalidEmail = "aaa"
    fileprivate var validPassword = "abcd1234567"
    fileprivate var invalidPassword = "ccc"
    
    override func setUp() {
        super.setUp()
        mockLoginViewController = MockLoginViewController()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

extension LoginViewModelTest {
    func testInit_ValidView_InstantiatesObject() {
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_ValidView_CopiesViewToIvar() {
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        if let lhs = mockLoginViewController,
            let rhs = viewModel.view as? MockLoginViewController {
            XCTAssertTrue(lhs === rhs)
        }
    }
    
    func testPerformInitialViewSetup_Calls_ClearEmailField_OnViewController() {
        let expectation = self.expectation(description: "expected clearEmailField() to be called")
        mockLoginViewController!.expectationForClearEmailField = expectation
        
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        let expectation = self.expectation(description: "expected clearPasswordField() to be called")
        mockLoginViewController!.expectationForClearPasswordField = expectation
        
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    func testPerformInitialViewSetup_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLoginButton(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.performInitialViewSetup()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: email/password DidEndOnExit test
extension LoginViewModelTest {
    func testEmailDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.emailDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.passwordDidEndOnExit()
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: email TextField update
extension LoginViewModelTest {
    func testEmailUpdate_Calls_Validate_OnEmailValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.emailValidator = MockEmailAddressValidator(expectation, expectedValue: validEmail)
        
        viewModel.emailTextFieldUpdated(validEmail)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailUpdated_ValidEmail_PasswordValidated_EnablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.passwordValidated = true
        viewModel.emailTextFieldUpdated(validEmail)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailUpdated_ValidEmail_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.passwordValidated = false
        viewModel.emailTextFieldUpdated(validEmail)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailUpdated_InvalidEmail_PasswordValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.passwordValidated = true
        viewModel.emailTextFieldUpdated(invalidEmail)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailUpdated_InvalidEmail_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.passwordValidated = false
        viewModel.emailTextFieldUpdated(invalidEmail)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: password TextField update
extension LoginViewModelTest {
    func testPasswordUpdate_Calls_Validate_OnPasswordValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        
        viewModel.passwordTextFieldUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_EmailValidated_EnablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.emailValidated = true
        viewModel.passwordTextFieldUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_EmailNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.emailValidated = false
        viewModel.passwordTextFieldUpdated(validEmail)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_EmailValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.emailValidated = true
        viewModel.passwordTextFieldUpdated(invalidPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_EmailNotValidated_DisablesLoginButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.emailValidated = false
        viewModel.passwordTextFieldUpdated(invalidEmail)
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: login test

extension LoginViewModelTest {
    func testLogin_ValidParameters_Calls_doLogin_OnLoginController() {
        let expectation = self.expectation(description: "expected doLogin() to be called")
        let mockLoginController = MockLoginController(expectation,
                                                      expectedEmail: validEmail,
                                                      expectedPassword: validPassword)
        mockLoginController.shouldReturnTrueOnLogin = true
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.loginController = mockLoginController
        mockLoginController.loginControllerDelegate = viewModel
        viewModel.login(email: validEmail, password: validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidParameters_Calls_doLoginWithExpectedEmail_OnLoginController() {
        let expectation = self.expectation(description: "expected doLogin() to be called")
        let mockLoginController = MockLoginController(expectation,
                                                      expectedEmail: validEmail,
                                                      expectedPassword:validPassword)
        mockLoginController.shouldReturnTrueOnLogin = true
        let viewModel = LoginViewModel(view: mockLoginViewController!)
        viewModel.loginController = mockLoginController
        mockLoginController.loginControllerDelegate = viewModel
        viewModel.login(email: validEmail, password: validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidParameters_Calls_doLoginWithExpectedPassword_OnLoginController() {
        let expectation = self.expectation(description: "expected doLogin() to be called")
        let mockLoginController = MockLoginController(expectation,
                                                      expectedEmail: validEmail,
                                                      expectedPassword: validPassword)
        mockLoginController.shouldReturnTrueOnLogin = true
        let viewModel = LoginViewModel(view:mockLoginViewController!)
        viewModel.loginController = mockLoginController
        mockLoginController.loginControllerDelegate = viewModel
        viewModel.login(email: validEmail, password: validPassword)
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
