//
//  LoginController.swift
//  UT-Demo
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation


protocol LoginControllerDelegate : class {
    func loginResult(result:Bool)
}

class LoginController : NSObject {
    let dummyEmail = "tuannd@gmail.com"
    let dummyPassword = "Abracadabra"
    weak var loginControllerDelegate : LoginControllerDelegate?
    
    init(delegate: LoginControllerDelegate?) {
        self.loginControllerDelegate = delegate
        super.init()
    }
    
    func doLogin(model: LoginModel) {
        let email = model.emailAddress
        let passWord = model.password
        
        if (email.compare(dummyEmail) == .orderedSame) && (passWord.compare(dummyPassword) == .orderedSame) {
            loginControllerDelegate?.loginResult(result: true)
        }
        
        loginControllerDelegate?.loginResult(result: false)
    }
}
