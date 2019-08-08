//
//  LoginViewModel.swift
//  UT-Demo
//
//  Created by maithigiang on 8/3/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation

class LoginViewModel: NSObject {
    
    weak var view: LoginViewControllerProtocol?
    var loginController: LoginController?
    var emailValidator: EmailAddressValidator?
    var passwordValidator: PasswordValidator?
    var emailValidated: Bool?
    var passwordValidated: Bool?
    
    var email = Dynamic<String>("")
    var password = Dynamic<String>("")
    var enableLogin = Dynamic<Bool> (false)
    
    override init() {
        super.init()
    }
    
    init(view: LoginViewControllerProtocol) {
        self.emailValidated = false
        self.passwordValidated = false
        super.init()
        
        self.view = view
    }
    
    func validateEmail() -> Bool {
        if email.value.isEmpty == true ||
            HelperManager.isValidEmail(email.value) == false {
            return false
        }
        return true
    }
    
    func validatePassword() -> Bool {
        if password.value.isEmpty == true ||
            password.value.count < 8 {
            return false
        }
        return true
    }
    
    func checkEnableLogin() {
        if self.validateEmail() && self.validatePassword() {
            enableLogin.value = true
        } else {
            enableLogin.value = false
        }
    }
    
    // MARK: For unit test
    
    func performInitialViewSetup() {
        view?.clearEmailField()
        view?.clearPasswordField()
        view?.enableLoginButton(false)
    }
    
    func login(email: String?, password: String?) {
        let controller = self.loginController ?? LoginController(delegate: self)
        if let email = email,
            let password = password,
            let model = LoginModel(email: email, password: password) {
            controller.doLogin(model: model)
        }
    }
    
    func emailDidEndOnExit() {
        self.view?.hideKeyboard()
    }
    
    func passwordDidEndOnExit() {
        self.view?.hideKeyboard()
    }
    
    func emailTextFieldUpdated(_ value:String?) {
        guard let checkValue = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = self.emailValidator ?? EmailAddressValidator()
        emailValidated = validator.validate(checkValue)
        
        if emailValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
    }
    
    func passwordTextFieldUpdated(_ value:String?) {
        guard let checkValue = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = self.passwordValidator ?? PasswordValidator()
        passwordValidated = validator.validate(checkValue)
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if emailValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
    }
}



extension LoginViewModel: LoginControllerDelegate {
    func loginResult(result: Bool) {
        //
    }
}
