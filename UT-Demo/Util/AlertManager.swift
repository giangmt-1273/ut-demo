//
//  AlertManager.swift
//  UT-Demo
//
//  Created by le.huu.dung on 8/28/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation
import UIKit

struct AlertManager {
    static func alertMesseage(title: String? = "",
                              message: String,
                              okButton: String? = "",
                              parentController: UIViewController,
                              handleOk: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okButton, style: .default, handler: { (alertAction) in
            if handleOk != nil {
                handleOk!()
            }
        }))
        
       
        parentController.present(alert, animated: true, completion: nil)
        
    }
    
    static func showErrorMessage(errorDataResponse: ResponseObject?, parent: UIViewController, handleCancel: (() -> Void)? ) {
        guard let errorData = errorDataResponse else {
            alertMesseage(title: "Error", message: "An unknown error", okButton: "Cancel", parentController: parent) {
                if handleCancel != nil {
                   handleCancel!()
                }
            }
            return
        }
        alertMesseage(title: "Error \(errorData.statusCode!.rawValue)", message: "Not find Error", okButton: "Cancel", parentController: parent) {
            if handleCancel != nil {
               handleCancel!()
            }
        }
        
    }
}
