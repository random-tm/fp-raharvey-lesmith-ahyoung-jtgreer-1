//
//  CryptoswiftWrapperTests.swift
//  PasswordGenerator
//
//  Created by Rachel Harvey on 11/17/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class CryptoswiftWrapperTests: XCTestCase {
    
    func testCryptoswiftPasswordIsNotNil() {
        for length in 12...24 {
            let password = CryptoswiftWrapper(length: length)
            XCTAssert(password.getPassword() as String! != nil)
        }
    }
    
    func testCryptoswiftPasswordLength() {
        for length in 12...24{
            let password = CryptoswiftWrapper(length: length)
            XCTAssert(password.getPassword().characters.count == length)
        }
    }
    
}

