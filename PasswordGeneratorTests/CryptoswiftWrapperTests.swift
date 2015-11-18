//
//  CryptoswiftWrapperTests.swift
//  PasswordGenerator
//
//  Created by admin on 11/17/15.
//  Copyright © 2015 Rachel Harvey, Lucas Smith, Aaron Young, and Jeffery Greer. All rights reserved.
//

import XCTest
@testable import PasswordGenerator

class CryptoswiftWrapperTests: XCTestCase {
    
    func testCrtyptoswiftIsNotNil() {
        let password = CryptoswiftWrapper(length: 12)
        XCTAssert(password.getPassword() as String! != nil)
    }
    
    func testRandomGenerationLength() {
        let password = CryptoswiftWrapper(length: 12)
        XCTAssert(password.getPassword().characters.count == 12)
    }
    
    func testTwoRandomPasswordsAreNotEqual() {
        let passwordOne = CryptoswiftWrapper(length: 12)
        let passwordTwo = CryptoswiftWrapper(length: 12)
        XCTAssert(passwordOne.getPassword() != passwordTwo.getPassword())
    }
    
}

