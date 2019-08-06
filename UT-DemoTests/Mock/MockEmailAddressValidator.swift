//
//  MockHelperManagerValidator.swift
//  UT-DemoTests
//
//  Created by ngo.doan.tuan on 8/6/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import XCTest

class MockEmailAddressValidator: EmailAddressValidator {
    
    private var expectation:XCTestExpectation?
    private var expectedValue:String?
    
    init(_ expectation:XCTestExpectation, expectedValue:String) {
        self.expectation = expectation
        self.expectedValue = expectedValue
        super.init()
    }
    
    override func validate(_ value:String) -> Bool {
        
        if let expectation = self.expectation,
            let expectedValue = self.expectedValue {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        return super.validate(value)
    }
}
