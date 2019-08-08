//
//  LoginModel.swift
//  UT-Demo
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation

class LoginModel: NSObject {
    var emailAddress: String
    var password: String
    
    init?(email:String, password:String, emailValidator:EmailAddressValidator? = nil, passwordValidator:PasswordValidator? = nil) {
        
        let validatorEmail = emailValidator ?? EmailAddressValidator()
        if validatorEmail.validate(email) == false {
            return nil
        }
        
        let validatorPass = passwordValidator ?? PasswordValidator()
        if validatorPass.validate(password) == false {
            return nil
        }
        
        self.emailAddress = email
        self.password = password
        
        super.init()
    }
}
