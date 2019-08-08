//
//  LoginViewControllerTest.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest

class LoginViewControllerTest: XCTestCase {

    fileprivate var validEmail = "tuanngodoan@gmail.vn"
    fileprivate let validPassword = "D%io7AFn9Y"
    
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
    
    func testEmailDidEndOnExit_Calls_EmailDidEndOnExit_OnViewModel() {
        let expectation = self.expectation(description: "expected emailDidEndOnExit() to be called")
        let loginViewController = LoginViewController()
        
        let viewModel = MockLoginViewModel(view:loginViewController)
        viewModel.emailDidEndOnExitExpectation = expectation
        
        loginViewController.viewModel = viewModel
        loginViewController.emailDidEndOnExit(self)
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordDidEndOnExit_Calls_PasswordDidEndOnExit_OnViewModel() {
        let expectation = self.expectation(description: "expected passwordDidEndOnExit() to be called")
        let loginViewController = LoginViewController()
        let viewModel = MockLoginViewModel(view:loginViewController)
        
        viewModel.passwordDidEndOnExitExpectation = expectation
        loginViewController.viewModel = viewModel
        loginViewController.passwordDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
// MARK: Test login
extension LoginViewControllerTest {
    func testLogin_ValidEmailAndPassword_Calls_Login_OnViewModel_WithExpectedEmail() {
        let expectation = self.expectation(description: "expected login() to be called")
        let emailTextFieldStub = UITextFieldStub(text: validEmail)
        let passwordTextFieldStub = UITextFieldStub(text: "")
        let loginViewController = LoginViewController()
        
        loginViewController.emailTextField = emailTextFieldStub
        loginViewController.passwordTextField = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view:loginViewController)
        viewModel.loginExpectation = (expectation,
                                      expectedUserName: validEmail,
                                      expectedPassword: "")
        loginViewController.viewModel = viewModel
        loginViewController.login(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidEmailAndPassword_Calls_Login_OnViewModel_WithExpectedPassword() {
        let expectation = self.expectation(description: "expected login() to be called")
        let emailTextFieldStub = UITextFieldStub(text: "")
        let passwordTextFieldStub = UITextFieldStub(text: validPassword)
        let loginViewController = LoginViewController()
        
        loginViewController.emailTextField = emailTextFieldStub
        loginViewController.passwordTextField = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view:loginViewController)
        viewModel.loginExpectation = (expectation, expectedUserName: "",
                                      expectedPassword: validPassword)
        loginViewController.viewModel = viewModel
        loginViewController.login(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}

extension LoginViewControllerTest {
    func testTextFieldShouldChangeCharacters_EmailTextField_Calls_EmailUpdated_OnViewModel_WithExpectedUsername() {
        let expectation = self.expectation(description: "expected userNameUpdated() to be called")
        let emailTextFieldStub = UITextFieldStub(text: validEmail)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let loginViewController = LoginViewController()
        loginViewController.emailTextField = emailTextFieldStub
        loginViewController.passwordTextField = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view:loginViewController)
        viewModel.emailUpdatedExpectation = (expectation,
                                                expectedValue: validEmail)
        loginViewController.viewModel = viewModel
        let _ = loginViewController.textField(emailTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testTextFieldShouldChangeCharacters_passwordTextField_Calls_PasswordUpdated_OnViewModel_WithExpectedEmail() {
        let expectation = self.expectation(description: "expected passwordUpdated() to be called")
        let emailTextFieldStub = UITextFieldStub(text: validEmail)
        let passwordTextFieldStub = UITextFieldStub(text: validPassword)
        let loginViewController = LoginViewController()
        loginViewController.emailTextField = emailTextFieldStub
        loginViewController.passwordTextField = passwordTextFieldStub
        
        let viewModel = MockLoginViewModel(view:loginViewController)
        viewModel.passwordUpdatedExpectation = (expectation,
                                                expectedValue:validPassword)
        loginViewController.viewModel = viewModel
        let _ = loginViewController.textField(passwordTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

}
