//
//  EmailAddressValidator.swift
//  UT-Demo
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation

public class EmailAddressValidator: NSObject {
    
    func validate(_ value: String) -> Bool {
        return HelperManager.isValidEmail(value)
    }
    
}
