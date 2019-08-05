//
//  Helppermanager.swift
//  UT-Demo
//
//  Created by maithigiang on 8/3/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation
class HelperManager {
    static let shared = HelperManager()
    
    private init() {}
    
    static func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
}
