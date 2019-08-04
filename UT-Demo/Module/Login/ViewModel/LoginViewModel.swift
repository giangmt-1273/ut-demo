//
//  LoginViewModel.swift
//  UT-Demo
//
//  Created by maithigiang on 8/3/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation

class LoginViewModel: NSObject {
    var email = Dynamic<String>("")
    var password = Dynamic<String>("")
    var enableLogin = Dynamic<Bool> (false)
    
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
}
