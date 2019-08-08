//
//  LoginViewControllerProtocol.swift
//  UT-Demo
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol : class{
    func clearEmailField()
    func clearPasswordField()
    func enableLoginButton(_ status:Bool)
    func hideKeyboard()
}
