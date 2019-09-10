//
//  ViewController.swift
//  UT-Demo
//
//  Created by le.huu.dung on 8/28/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation
import UIKit
//
//enum ErrorCode: String {
//    case invalidToken = "1010"
//}

extension UIViewController {
    
    func getErrorMessage(_ errorCode: String?) -> String? {
        var errorString: String? = nil
        // check
//        if ErrorCode.invalidToken.rawValue == errorCode {
//            errorString  = "Parameters missing or blank"
//        } else {
//            errorString = errorCode
//        }
        return errorString
    }
}
