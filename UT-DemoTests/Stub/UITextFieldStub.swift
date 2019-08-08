//
//  UITextFieldStub.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/8/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldStub : TextField {
    init(text: String) {
        super.init(frame: CGRect.zero)
        super.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
